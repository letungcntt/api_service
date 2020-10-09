defmodule ApiService.KhaiBaoYTeHangNgay do
	use Ecto.Schema
	import Ecto.Changeset
	alias ApiService.KhaiBaoYTeHangNgay

	schema "KhaiBaoYTeHangNgay" do
		field :idUser, :integer
		field :datetime_KhaiBao , :naive_datetime
		field :trieuChung_Sot , :boolean
		field :trieuChung_Ho , :boolean
		field :trieuChung_KhoTho , :boolean
		field :trieuChung_DauNguoiMetMoi , :boolean 
		timestamps()
	end
end