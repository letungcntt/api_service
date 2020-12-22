defmodule ApiService.Repo.Migrations.AddTable_PostGis do
  use Ecto.Migration

  def change do
    create table(:map) do
      add :name_factory, :string
      add :kinh_do, :string
      add :vi_do, :string
      add :is_removed, :boolean, default: false

      timestamps()
    end
  end
end
