defmodule ApiServiceWeb.UserDetailController do
        use ApiServiceWeb, :controller
        alias ApiService.{Repo, UserDetail }
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
            u in UserDetail,
            select: %{idUser: u.idUser, cmndUser: u.cmndUser, fullnameUser: u.fullnameUser, sexUser: u.sexUser, dobUser: u.dobUser, dateString: u.dateString, phoneNumberUser: u.phoneNumberUser, emailUser: u.emailUser, addressUser: u.addressUser, dateCMNDUser: u.dateCMNDUser, whereCMNDUser: u.whereCMNDUser, avatarUser: u.avatarUser, statusUser: u.statusUser, is_removed: u.is_removed}
        ) |> Repo.all
        json conn, %{data: squery}
    end

    def create(conn, params) do
        Repo.insert(%UserDetail{
          idUser: params["idUser"],
          cmndUser: params["cmndUser"],
          fullnameUser: params["fullnameUser"],
          sexUser: params["sexUser"],
          dobUser: navie_utc_now_second(),
          phoneNumberUser: params["phoneNumberUser"],
          emailUser: params["emailUser"],
          addressUser: params["addressUser"],
          dateCMNDUser: navie_utc_now_second(),
          whereCMNDUser: params["whereCMNDUser"],
          avatarUser: params["avatarUser"],
          statusUser: params["statusUser"],
          dateString: params["dateString"],
          is_removed: false,
          inserted_at: navie_utc_now_second(),
          updated_at: navie_utc_now_second()
        })

        |> case do
          {:ok, userdetail} -> json conn, %{userdetail: userdetail |> struct_to_map, success: true}
          _ -> json conn, %{success: false}
        end
      end
    end
