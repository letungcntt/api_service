defmodule ApiService.Repo.Migrations.After do
  use Ecto.Migration

  def change do
    alter table(:users_detail) do
      add :dateString, :string
    end
  end
end
