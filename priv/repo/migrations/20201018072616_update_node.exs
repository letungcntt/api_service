defmodule ApiService.Repo.Migrations.UpdateNode do
  use Ecto.Migration

  def change do
    alter table(:PhanAnhNguoiTiepXuc) do
      add :noiDungPhanAnhKhac2, :string
    end
  end
end
