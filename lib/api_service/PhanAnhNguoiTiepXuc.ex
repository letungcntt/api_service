defmodule ApiService.PhanAnhNguoiTiepXuc do
    use Ecto.Schema
    import Ecto.Changeset
    alias ApiService.PhanAnhNguoiTiepXuc

    schema "PhanAnhNguoiTiepXuc" do
      field :idUser, :integer
      field :thoiGianPhanAnh, :naive_datetime
      field :tiepXuc_NghiNgo  , :boolean
      field :troVeTuVungDich  , :boolean
      field :coNguoiTiepXucTuVungDich  , :boolean
      field :noiDungPhanAnhKhac  , :boolean
      field :viTri_TinhThanhPho  , :integer
      field :viTri_QuanHuyen, :integer
      field :viTri_PhuongXa, :integer
      field :soNha_Duong, :string
      field :is_removed, :boolean, default: false
      timestamps()
    end
  end