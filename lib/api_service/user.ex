defmodule ApiService.User do
    use Ecto.Schema
    import Ecto.Changeset
    alias ApiService.User

    schema "users" do
			field :name, :string
			field :email, :string
			field :cmnd, :string
			field :account, :string
			field :password, :string
			field :is_removed, :boolean, default: false
      timestamps()
    end
  end