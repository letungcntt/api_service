defmodule ApiServiceWeb.MapController do
  use ApiServiceWeb, :controller

  alias ApiService.{ Repo, Map }
  import Ecto.Query, only: [from: 2]

def navie_utc_now_second do
  NaiveDateTime.utc_now
  |> NaiveDateTime.truncate(:second)
end

def index(conn, _params) do
  squery = from(
      u in Map,
      select: %{name_factory: u.name_factory, kinh_do: u.kinh_do, vi_do: u.vi_do}
  ) |> Repo.all
  json conn, %{data: squery}
end

# def create(conn, params) do
#     Repo.insert(%User{
#       name: params["name"],
#       email: params["email"],
#       cmnd: params["cmnd"],
#       account: params["account"],
#       password: params["password"],
#       is_removed: false,
#       inserted_at: navie_utc_now_second(),
#       updated_at: navie_utc_now_second()
#     })

#     |> case do
#       {:ok, user} -> json conn, %{user: user |> struct_to_map, success: true}
#       _ -> json conn, %{success: false}
#     end
# end

# def update(conn, params) do
#   from(
#     u in User,
#     where: u.id == ^params["id"] and u.is_removed == false
#   ) |> Repo.update_all(set: [password: params["password"]])

#   json conn, %{success: true}
# end

# def delete(conn, params) do
#   from(
#     u in User,
#     where: u.id == ^params["id"] and u.is_removed == false
#   ) |> Repo.delete_all

#   json conn, %{success: true}
# end

end
