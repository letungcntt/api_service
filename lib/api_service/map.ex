defmodule ApiService.Maps do
	use Ecto.Schema
	import Ecto.Changeset
	alias ApiService.Maps

	schema "thuy_dien" do
		field :ten_thuy_dien, :string
		field :cong_xuat, :float
		field :san_luong, :float
		field :nam_khoi_cong, :string
		field :nam_hoat_dong, :string
		field :kinh_do, :float
		field :vi_do, :float
		field :tren_song, :string
		field :vi_tri_hanh_chinh, :string
		field :tinh_trang, :string
		field :quy_mo, :string
		field :loai , :string
		field :dung_tich , :float
		field :luu_vuc , :string
		field :chu_dau_tu , :string
		field :loai_hinh , :string
		field :von_dau_tu , :float
	end
end
