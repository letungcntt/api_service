defmodule ApiServiceWeb.KhaiBaoTiepXuc do
        use ApiServiceWeb, :controller
        alias ApiService.{Repo, KhaiBaoTiepXuc }
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
                u in KhaiBaoTiepXuc,
                select: %{idUser: u.idUser, coDiTuNuocNgoai: u.coDiTuNuocNgoai, coTiepXucNguoiDiTuNuocNgoai: u.coTiepXucNguoiDiTuNuocNgoai, coBietXungQuanhCoTruongHopNuocNgoai: u.coBietXungQuanhCoTruongHopNuocNgoai, is_removed: u.is_removed}
            ) |> Repo.all
            json conn, %{data: squery}
        end
        def create(conn, _params) do
            params = %{idUser: "1", coDiTuNuocNgoai: true, coTiepXucNguoiDiTuNuocNgoai: true, coBietXungQuanhCoTruongHopNuocNgoai: true, is_removed: false}
            Repo.insert(%KhaiBaoTiepXuc{
              idUser: params["idUser"],
              coDiTuNuocNgoai: params["coDiTuNuocNgoai"],
              coTiepXucNguoiDiTuNuocNgoai: params["coTiepXucNguoiDiTuNuocNgoai"],
              coBietXungQuanhCoTruongHopNuocNgoai: params["coBietXungQuanhCoTruongHopNuocNgoai"],
              is_removed: false,
              inserted_at: navie_utc_now_second(),
              updated_at: navie_utc_now_second()
            })
      
            |> case do
              {:ok, khaibaotiepxuc} -> json conn, %{khaibaotiepxuc: khaibaotiepxuc |> struct_to_map, success: true}
              _ -> json conn, %{success: false}
            end
          end
    end