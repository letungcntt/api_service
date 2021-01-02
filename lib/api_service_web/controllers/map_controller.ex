defmodule ApiServiceWeb.MapsController do
  use ApiServiceWeb, :controller

  alias ApiService.{ Repo, Maps }
  import Ecto.Query, only: [from: 2]

  def navie_utc_now_second do
    NaiveDateTime.utc_now
    |> NaiveDateTime.truncate(:second)
  end


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

end
