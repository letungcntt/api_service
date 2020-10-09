defmodule ApiServiceWeb.UserController do
    use ApiServiceWeb, :controller

    alias ApiService.{ Repo, User, KhaiBaoYTeHangNgay }
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
          u in User,
          select: %{name: u.name, email: u.email}
      ) |> Repo.all
      json conn, %{data: squery}
    end

    def create(conn, params) do
      params = %{name: "VietDD", email: "doanvietcntt99@gmail.com", cmnd: "001099005803", account: "doanvietcntt99", password: "Viet2199"}
      squery =
        Repo.insert(%User{
          name: params["name"],
          email: params["email"],
          cmnd: params["cmnd"],
          account: params["account"],
          password: params["password"],
          is_removed: false,
          inserted_at: navie_utc_now_second(),
          updated_at: navie_utc_now_second()
        })

        |> case do
          {:ok, user} -> json conn, %{user: user |> struct_to_map, success: true}
          _ -> json conn, %{success: false}
        end
    end
    
  end
  