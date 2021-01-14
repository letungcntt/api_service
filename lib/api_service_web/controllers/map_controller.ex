defmodule ApiServiceWeb.MapsController do
  use ApiServiceWeb, :controller

  alias ApiService.{ Repo, Maps }
  import Ecto.Query, only: [from: 2]

  def navie_utc_now_second do
    NaiveDateTime.utc_now
    |> NaiveDateTime.truncate(:second)
  end

  def struct_to_map(struct, drop_keys \\ [])
  def struct_to_map(nil, _), do: nil
  def struct_to_map({:ok, struct}, drop_keys), do: {:ok, struct_to_map(struct, drop_keys)}
  def struct_to_map({:error, _} = error, _), do: error
  def struct_to_map(struct, drop_keys) when is_list(struct), do: Enum.map(struct, &struct_to_map(&1, drop_keys))
  def struct_to_map(struct, drop_keys), do: Map.drop(struct, [:__meta__, :__struct__] ++ drop_keys)

  def index(conn, _params) do
    squery = from(
      u in Maps,
      limit: 100,
      select: %{
        ten_thuy_dien: u.ten_thuy_dien,
        cong_xuat: u.cong_xuat,
        san_luong: u.san_luong,
        nam_khoi_cong: u.nam_khoi_cong,
        nam_hoat_dong: u.nam_hoat_dong,
        kinh_do: u.kinh_do,
        vi_do: u.vi_do,
        tren_song: u.tren_song,
        vi_tri_hanh_chinh: u.vi_tri_hanh_chinh,
        tinh_trang: u.tinh_trang,
        quy_mo: u.quy_mo,
        loai: u.loai,
        dung_tich: u.dung_tich,
        luu_vuc: u.luu_vuc,
        chu_dau_tu: u.chu_dau_tu,
        loai_hinh: u.loai_hinh,
        von_dau_tu: u.von_dau_tu,
      }
    ) |> Repo.all

    json conn, %{data: squery}
  end

  def find(conn, params) do
    squery = from(
      u in Maps,
      where: u.tren_song == ^params["tren_song"],
      select: %{
        ten_thuy_dien: u.ten_thuy_dien,
        cong_xuat: u.cong_xuat,
        san_luong: u.san_luong,
        nam_khoi_cong: u.nam_khoi_cong,
        nam_hoat_dong: u.nam_hoat_dong,
        kinh_do: u.kinh_do,
        vi_do: u.vi_do,
        tren_song: u.tren_song,
        vi_tri_hanh_chinh: u.vi_tri_hanh_chinh,
        tinh_trang: u.tinh_trang,
        quy_mo: u.quy_mo,
        loai: u.loai,
        dung_tich: u.dung_tich,
        luu_vuc: u.luu_vuc,
        chu_dau_tu: u.chu_dau_tu,
        loai_hinh: u.loai_hinh,
        von_dau_tu: u.von_dau_tu,
      }
    ) |> Repo.all

    json conn, %{data: squery}
  end

  def create(conn, params) do

    {cong_xuat, _} = Float.parse(params["cong_xuat"])
    {san_luong, _} = Float.parse(params["san_luong"])
    {kinh_do, _} = Float.parse(params["kinh_do"])
    {vi_do, _} = Float.parse(params["vi_do"])
    {dung_tich, _} = Float.parse(params["dung_tich"])

    Repo.insert(%Maps{
      ten_thuy_dien: params["ten_thuy_dien"],
      cong_xuat: cong_xuat ,
      san_luong: san_luong ,
      kinh_do: kinh_do,
      vi_do: vi_do,
      vi_tri_hanh_chinh: params["vi_tri_hanh_chinh"],
      tinh_trang: params["tinh_trang"],
      quy_mo: params["quy_mo"],
      loai: params["loai"],
      tren_song: params["tren_song"],
      dung_tich: dung_tich,
      chu_dau_tu: params["chu_dau_tu"]
    })

    |> case do
      {:ok, data} -> json conn, %{data: data |> struct_to_map, success: true}
      _ -> json conn, %{success: false}
    end
  end

  def update(conn, params) do

    {cong_xuat, _} = Float.parse(params["cong_xuat"])
    {san_luong, _} = Float.parse(params["san_luong"])
    {kinh_do, _} = Float.parse(params["kinh_do"])
    {vi_do, _} = Float.parse(params["vi_do"])
    {dung_tich, _} = Float.parse(params["dung_tich"])

    from(
      u in Maps,
      where: u.id == ^params["id"]
    ) |> Repo.update_all(
      set: [
        ten_thuy_dien: params["ten_thuy_dien"],
        cong_xuat: cong_xuat ,
        san_luong: san_luong ,
        kinh_do: kinh_do,
        vi_do: vi_do,
        vi_tri_hanh_chinh: params["vi_tri_hanh_chinh"],
        tinh_trang: params["tinh_trang"],
        quy_mo: params["quy_mo"],
        loai: params["loai"],
        tren_song: params["tren_song"],
        dung_tich: dung_tich,
        chu_dau_tu: params["chu_dau_tu"]
      ]
    )

    json conn, %{success: true}
  end

  def delete(conn, params) do
    from(
      u in Maps,
      where: u.id == ^params["id"]
    ) |> Repo.delete_all

    json conn, %{success: true}
  end

end
