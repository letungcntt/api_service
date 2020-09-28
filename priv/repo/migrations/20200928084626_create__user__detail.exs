defmodule ApiService.Repo.Migrations.Create_User_Detail do
  use Ecto.Migration

  def change do
    create table(:users_detail) do
      add :idUser, :integer
      add :cmndUser, :string
      add :fullnameUser, :string
      add :sexUser, :integer
      add :dobUser, :naive_datetime
      add :phoneNumberUser, :string 
      add :emailUser, :string
      add :addressUser, :string
      add :dateCMNDUser, :naive_datetime
      add :whereCMNDUser, :string 
      add :avatarUser, :string
      add :statusUser, :boolean, default: true
      add :is_removed, :boolean, default: false

      timestamps()
    end
  end
end
