defmodule ApiServiceWeb.Router do
  use ApiServiceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", ApiServiceWeb do
    pipe_through [:api]
    resources "/users", UserController, only: [:index, :create]
    put "/update", UserController, :update
    put "/delete", UserController, :delete
    post "/login", UserController, :login
    resources "/usersdetail", UserDetailController, only: [:index, :create]
    resources "/khaibaoytehangngay", KhaiBaoYTeHangNgayController, only: [:index, :create]
    resources "/khaibaoytetunguyen", KhaiBaoYTeTuNguyenController, only: [:index, :create]
    resources "/khaibaotiepxuc", KhaiBaoTiepXucController, only: [:index, :create]
    resources "/phananhnguoitiepxuc", PhanAnhNguoiTiepXucController, only: [:index, :create]
    resources "/map", MapsController, only: [:index, :create]
    put "/delete_thuy_dien", MapsController, :delete
    put "/update_thuy_dien", MapsController, :update
    post "/find", MapsController, :find
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApiServiceWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ApiServiceWeb.Telemetry
    end
  end
end
