defmodule ApiServiceWeb.KhaiBaoYTeTuNguyen do
        use ApiServiceWeb, :controller
        alias ApiService.{Repo, KhaiBaoYTeTuNguyen }
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
            u in KhaiBaoYTeTuNguyen,
            select: %{idUser: u.idUser, datetime_KhaiBao: u.datetime_KhaiBao}
        ) |> Repo.all
        json conn, %{data: squery}
    end
    
    def create(conn, _params) do
        params = %{idUser: "1", Question_Tiepxuc: true, Question_Divetuvungdich: true, Question_Tiepxucnguoidituvungdich: true, Question_VungQuocGia: true, trieuChung_Sot: true, trieuChung_Sot: true,trieuChung_Ho: true, trieuChung_KhoTho: true, trieuChung_ViemPhoi: true, trieuChung_DauHong: true, trieuChung_MetMoi: true, tienSuBenh_GanManTinh: true, tienSuBenh_PhoiManTinh: true, tienSuBenh_PhoiManTinh: true, tienSuBenh_ThanManTinh: true, tienSuBenh_TimMach: true, tienSuBenh_HuyetApCao: true, tienSuBenh_HIV: true, tienSuBenh_GhepThanTangXuong: true, tienSuBenh_TieuDuong: true, tienSuBenh_UngThu: true, tienSuBenh_CoThai: true, is_removed: false}
        Repo.insert(%KhaiBaoYTeTuNguyen{
        
          idUser: params["idUser"],
          datetime_KhaiBao: navie_utc_now_second(),
          Question_Tiepxuc: params["Question_Tiepxuc"],
          Question_Divetuvungdich: params["Question_Divetuvungdich"],
          Question_Tiepxucnguoidituvungdich: params["Question_Tiepxucnguoidituvungdich"],
          Question_VungQuocGia: params["Question_VungQuocGia"],
          trieuChung_Sot: params["trieuChung_Sot"],
          trieuChung_Ho: params["trieuChung_Ho"],
          trieuChung_KhoTho: params["trieuChung_KhoTho"], 
          trieuChung_ViemPhoi: params["trieuChung_ViemPhoi"], 
          trieuChung_DauHong: params["trieuChung_DauHong"],
          trieuChung_MetMoi: params["trieuChung_MetMoi"],
          tienSuBenh_GanManTinh: params["tienSuBenh_GanManTinh"],
          tienSuBenh_PhoiManTinh: params["tienSuBenh_PhoiManTinh"],
          tienSuBenh_ThanManTinh: params["tienSuBenh_ThanManTinh"],
          tienSuBenh_TimMach: params["tienSuBenh_TimMach"], 
          tienSuBenh_HuyetApCao: params["tienSuBenh_HuyetApCao"],
          tienSuBenh_HIV: params["tienSuBenh_HIV"], 
          tienSuBenh_GhepThanTangXuong: params["tienSuBenh_GhepThanTangXuong"],
          tienSuBenh_TieuDuong: params["tienSuBenh_TieuDuong"],
          tienSuBenh_UngThu: params["tienSuBenh_UngThu"],
          tienSuBenh_CoThai: params["tienSuBenh_CoThai"],
          is_removed: params["is_removed"],
          inserted_at: navie_utc_now_second(),
          updated_at: navie_utc_now_second()
        })
  
        |> case do
          {:ok, khaibaoytetunguyen} -> json conn, %{khaibaoytetunguyen: khaibaoytetunguyen |> struct_to_map, success: true}
          _ -> json conn, %{success: false}
        end
      end
    end