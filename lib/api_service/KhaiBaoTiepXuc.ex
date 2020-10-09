defmodule ApiService.KhaiBaoTiepXuc do
	use Ecto.Schema
	import Ecto.Changeset
	alias ApiService.KhaiBaoTiepXuc

	schema "KhaiBaoTiepXuc" do
		field :idUser, :integer
		field :coDiTuNuocNgoai, :boolean
		field :coTiepXucNguoiDiTuNuocNgoai, :boolean
		field :coBietXungQuanhCoTruongHopNuocNgoai, :boolean
		field :is_removed, :boolean, default: false
		timestamps()
	end
end