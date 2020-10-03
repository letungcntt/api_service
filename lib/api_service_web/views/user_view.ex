defmodule ApiServiceWeb.User do
    use ApiServiceWeb, :view

    def render("index.json", %{user: user} = params) do
      IO.inspect params
    end
  end