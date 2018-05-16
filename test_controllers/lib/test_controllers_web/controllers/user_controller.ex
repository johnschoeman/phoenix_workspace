defmodule TestControllersWeb.UserController do
  use TestControllersWeb, :controller
  alias TestControllers.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_user(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> text("User not found")

      user ->
        render(conn, "show.json", user: user)
    end
  end
end
