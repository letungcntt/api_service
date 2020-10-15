defmodule ApiServiceWeb.KhaiBaoYTeHangNgayController do
        use ApiServiceWeb, :controller
        alias ApiService.{Repo, KhaiBaoYTeHangNgay }
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
            u in KhaiBaoYTeHangNgay,
            select: %{idUser: u.idUser, datetime_KhaiBao: u.datetime_KhaiBao, trieuChung_Sot: u.trieuChung_Sot, trieuChung_Ho: u.trieuChung_Ho, trieuChung_KhoTho: u.trieuChung_KhoTho, trieuChung_DauNguoiMetMoi: u.trieuChung_DauNguoiMetMoi}
        ) |> Repo.all
        json conn, %{data: squery}
    end

    def create(conn, params) do
        Repo.insert(%KhaiBaoYTeHangNgay{
          idUser: params["idUser"],
          datetime_KhaiBao: navie_utc_now_second(),
          trieuChung_Sot: params["trieuChung_Sot"],
          trieuChung_Ho: params["trieuChung_Ho"],
          trieuChung_KhoTho: params["trieuChung_KhoTho"],
          trieuChung_DauNguoiMetMoi: params["trieuChung_DauNguoiMetMoi"],
          inserted_at: navie_utc_now_second(),
          updated_at: navie_utc_now_second()
        })
  
        |> case do
          {:ok, khaibaoytehangngay} -> json conn, %{khaibaoytehangngay: khaibaoytehangngay |> struct_to_map, success: true}
          _ -> json conn, %{success: false}
        end
      end

    end