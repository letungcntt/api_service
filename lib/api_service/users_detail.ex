defmodule ApiService.UserDetail do
    use Ecto.Schema
    import Ecto.Changeset
    alias ApiService.UserDetail

    schema "users_detail" do
      field :idUser, :integer
      field :cmndUser, :string
      field :fullnameUser, :string
      field :sexUser, :integer
      field :dobUser, :naive_datetime
      field :phoneNumberUser, :string 
      field :emailUser, :string
      field :addressUser, :string
      field :dateCMNDUser, :naive_datetime
      field :whereCMNDUser, :string 
      field :avatarUser, :string
      field :statusUser, :boolean, default: true
      field :is_removed, :boolean, default: false
      timestamps()
    end
  end