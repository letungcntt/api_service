defmodule ApiService.Repo.Migrations.New_TableConvert do
  use Ecto.Migration

  def change do
    create table(:thuy_dien) do
      add :ten_thuy_dien, :string
      add :cong_xuat, :float
      add :san_luong, :float
      add :nam_khoi_cong, :string
      add :nam_hoat_dong, :string
      add :kinh_do, :float
      add :vi_do, :float
      add :tren_song, :string
      add :vi_tri_hanh_chinh, :string
      add :tinh_trang, :string
      add :quy_mo, :string
      add :loai , :string
      add :dung_tich , :float
      add :luu_vuc , :string
      add :chu_dau_tu , :string
      add :loai_hinh , :string
      add :von_dau_tu , :float

    end
  end
end
