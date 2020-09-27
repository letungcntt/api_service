defmodule ApiService.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :account, :string
      add :password, :string
      add :is_removed, :boolean, default: false

      timestamps()
    end
  end
end
