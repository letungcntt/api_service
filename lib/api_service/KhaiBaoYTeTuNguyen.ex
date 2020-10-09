defmodule ApiService.KhaiBaoYTeTuNguyen do
	use Ecto.Schema
	import Ecto.Changeset
	alias ApiService.KhaiBaoYTeTuNguyen

	schema "KhaiBaoYTeTuNguyen" do
		field :idUser, :integer
		field :datetime_KhaiBao, :naive_datetime
		field :Question_Tiepxuc, :boolean
		field :Question_Divetuvungdich, :boolean
		field :Question_Tiepxucnguoidituvungdich, :boolean
		field :Question_VungQuocGia, :boolean
		field :trieuChung_Sot, :boolean
		field :trieuChung_Ho, :boolean
		field :trieuChung_KhoTho, :boolean
		field :trieuChung_ViemPhoi, :boolean
		field :trieuChung_DauHong, :boolean
		field :trieuChung_MetMoi, :boolean
		field :tienSuBenh_GanManTinh, :boolean
		field :tienSuBenh_PhoiManTinh, :boolean
		field :tienSuBenh_ThanManTinh, :boolean
		field :tienSuBenh_TimMach, :boolean
		field :tienSuBenh_HuyetApCao, :boolean
		field :tienSuBenh_HIV, :boolean
		field :tienSuBenh_GhepThanTangXuong, :boolean
		field :tienSuBenh_TieuDuong, :boolean
		field :tienSuBenh_UngThu, :boolean
		field :tienSuBenh_CoThai, :boolean
		field :is_removed, :boolean, default: false
		timestamps()
	end
end