defmodule ApiService.Repo.Migrations.Create_PhanAnhNguoiTiepXuc do
  use Ecto.Migration

  def change do
    create table(:PhanAnhNguoiTiepXuc) do
      add :idUser, :integer
      add :thoiGianPhanAnh, :naive_datetime
      add :tiepXuc_NghiNgo  , :boolean
      add :troVeTuVungDich  , :boolean
      add :coNguoiTiepXucTuVungDich  , :boolean
      add :noiDungPhanAnhKhac  , :boolean
      add :viTri_TinhThanhPho  , :integer
      add :viTri_QuanHuyen, :integer
      add :viTri_PhuongXa, :integer
      add :soNha_Duong, :string
      add :is_removed, :boolean, default: false

      timestamps()
    end
  end
end
