defmodule ApiService.Repo.Migrations.Create_KhaiBaoTiepXuc do
  use Ecto.Migration

  def change do
    create table(:KhaiBaoTiepXuc) do
      add :idUser, :integer
      add :coDiTuNuocNgoai, :boolean
      add :coTiepXucNguoiDiTuNuocNgoai, :boolean
      add :coBietXungQuanhCoTruongHopNuocNgoai, :boolean
      add :is_removed, :boolean, default: false

      timestamps()
    end
  end
end
