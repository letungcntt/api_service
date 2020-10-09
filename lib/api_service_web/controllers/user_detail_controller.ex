defmodule ApiServiceWeb.UserDetail do
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
            select: %{idUser: u.idUser, cmndUser: u.cmndUser, fullnameUser: u.fullnameUser, sexUser: u.sexUser, dobUser: u.dobUser, phoneNumberUser: u.phoneNumberUser, emailUser: u.emailUser, addressUser: u.addressUser, dateCMNDUser: u.dateCMNDUser, whereCMNDUser: u.whereCMNDUser, avatarUser: u.avatarUser, statusUser: u.statusUser, is_removed: u.is_removed}
        ) |> Repo.all
        json conn, %{data: squery}
    end
    
    def create(conn, _params) do
        params = %{idUser: "1", cmndUser: "1781310183", fullnameUser: "Đinh Doãn Việt", sexUser: "1", dobUser: "1999/01/02", phoneNumberUser: "0965062715", emailUser: "doanvietcntt99@gmail.com", addressUser: "Hà Nội", dateCMNDUser: "2015/03/11", whereCMNDUser: "Hà Nội", avatarUser: "default-avatar.jpg", statusUser: true, is_removed: false}
        Repo.insert(%UserDetail{
          idUser: params["idUser"],
          cmndUser: params["cmndUser"],
          fullnameUser: params["fullnameUser"],
          sexUser: params["sexUser"],
          dobUser: params["dobUser"],
          phoneNumberUser: params["phoneNumberUser"],
          emailUser: params["emailUser"],
          addressUser: params["addressUser"],
          dateCMNDUser: params["dateCMNDUser"],
          whereCMNDUser: params["whereCMNDUser"],
          avatarUser: params["avatarUser"],
          statusUser: params["statusUser"],
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