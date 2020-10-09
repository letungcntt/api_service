defmodule ApiServiceWeb.PhanAnhNguoiTiepXuc do
    use ApiServiceWeb, :controller
    alias ApiService.{Repo, PhanAnhNguoiTiepXuc }
    import Ecto.Query, only: [from: 2]
def struct_to_map(struct, drop_keys \\ [])
def struct_to_map(nil, _), do: nil
def struct_to_map({:ok, struct}, drop_keys), do: {:ok, struct_to_map(struct, drop_keys)}
def struct_to_map({:error, _} = error, _), do: error
def struct_to_map(struct, drop_keys) when is_list(struct), do: Enum.map(struct, &struct_to_map(&1, drop_keys))
def struct_to_map(struct, drop_keys), do: Map.drop(struct, [:__meta__, :__struct__] ++ drop_keys)
    def navie_utc_now_second do
        NaiveDateTime.utc_now
        |> NaiveDateTime.truncate(:second)
    end
    def index(conn, _params) do
        squery = from(
            u in PhanAnhNguoiTiepXuc,
            select: %{idUser: u.idUser, thoiGianPhanAnh: u.thoiGianPhanAnh, tiepXuc_NghiNgo: u.tiepXuc_NghiNgo, troVeTuVungDich: u.troVeTuVungDich, coNguoiTiepXucTuVungDich: u.coNguoiTiepXucTuVungDich, noiDungPhanAnhKhac: u.noiDungPhanAnhKhac, viTri_TinhThanhPho: u.viTri_TinhThanhPho, viTri_QuanHuyen: u.viTri_QuanHuyen, viTri_PhuongXa: u.viTri_PhuongXa, soNha_Duong: u.soNha_Duong, is_removed: u.is_removed}
        ) |> Repo.all
        json conn, %{data: squery}
    end
    def create(conn, _params) do
        params = %{idUser: "1", tiepXuc_NghiNgo: true, troVeTuVungDich: true, coNguoiTiepXucTuVungDich: true, noiDungPhanAnhKhac: true, viTri_TinhThanhPho: "1", viTri_QuanHuyen: "2", viTri_PhuongXa: "3", soNha_Duong: "Số 10", is_removed: false}
        Repo.insert(%PhanAnhNguoiTiepXuc{
          idUser: params["idUser"],
          thoiGianPhanAnh: navie_utc_now_second(),
          tiepXuc_NghiNgo: params["tiepXuc_NghiNgo"],
          troVeTuVungDich: params["troVeTuVungDich"],
          coNguoiTiepXucTuVungDich: params["coNguoiTiepXucTuVungDich"],
          noiDungPhanAnhKhac: params["noiDungPhanAnhKhac"],
          viTri_TinhThanhPho: params["viTri_TinhThanhPho"],
          viTri_QuanHuyen: params["viTri_QuanHuyen"],
          viTri_PhuongXa: params["viTri_PhuongXa"],
          soNha_Duong: params["soNha_Duong"],
          is_removed: false,
          inserted_at: navie_utc_now_second(),
          updated_at: navie_utc_now_second()
        })
  
        |> case do
          {:ok, phananhnguoitiepxuc} -> json conn, %{phananhnguoitiepxuc: phananhnguoitiepxuc |> struct_to_map, success: true}
          _ -> json conn, %{success: false}
        end
      end
end