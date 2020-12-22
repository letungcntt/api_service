defmodule ApiService.Map do
	use Ecto.Schema
	import Ecto.Changeset
	alias ApiService.Map

	schema "map" do
    field :name_factory, :string
    field :kinh_do, :string
    field :vi_do, :string
    field :is_removed, :boolean, default: false
		timestamps()
	end
end
