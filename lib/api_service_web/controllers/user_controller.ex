defmodule ApiServiceWeb.UserController do
    use ApiServiceWeb, :controller

    alias ApiService.{ Repo, User }
    import Ecto.Query, only: [from: 2]
  
    def index(conn, _params) do
      squery = from(
          u in User,
          select: %{name: u.name, email: u.email}
      ) |> Repo.all
      json conn, %{data: squery}
    end
  end