defmodule ApiService.Repo.Migrations.Create_KhaiBaoYTeHangNgay do
  use Ecto.Migration

  def change do
    create table(:users_checked) do
      add :idUser, :integer
      add :datetime_KhaiBao , :naive_datetime
      add :trieuChung_Sot , :boolean
      add :trieuChung_Ho , :boolean
      add :trieuChung_KhoTho , :boolean
      add :trieuChung_DauNguoiMetMoi , :boolean 

      timestamps()
    end
  end
end
