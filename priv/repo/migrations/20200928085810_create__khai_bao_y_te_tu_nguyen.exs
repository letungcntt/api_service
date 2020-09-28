defmodule ApiService.Repo.Migrations.Create_KhaiBaoYTeTuNguyen do
  use Ecto.Migration

  def change do
    create table(:KhaiBaoYTeTuNguyen) do
      add :idUser, :integer
      add :datetime_KhaiBao, :naive_datetime
      add :Question_Tiepxuc, :boolean
      add :Question_Divetuvungdich, :boolean
      add :Question_Tiepxucnguoidituvungdich, :boolean
      add :Question_VungQuocGia, :boolean
      add :trieuChung_Sot, :boolean
      add :trieuChung_Ho, :boolean
      add :trieuChung_KhoTho, :boolean
      add :trieuChung_ViemPhoi, :boolean
      add :trieuChung_DauHong, :boolean
      add :trieuChung_MetMoi, :boolean
      add :tienSuBenh_GanManTinh, :boolean
      add :tienSuBenh_PhoiManTinh, :boolean
      add :tienSuBenh_ThanManTinh, :boolean
      add :tienSuBenh_TimMach, :boolean
      add :tienSuBenh_HuyetApCao, :boolean
      add :tienSuBenh_HIV, :boolean
      add :tienSuBenh_GhepThanTangXuong, :boolean
      add :tienSuBenh_TieuDuong, :boolean
      add :tienSuBenh_UngThu, :boolean
      add :tienSuBenh_CoThai, :boolean
      add :is_removed, :boolean, default: false

      timestamps()
    end
  end
end
