defmodule TestControllers.UserControllerTest do
  use TestControllersWeb.ConnCase

  alias TestControllers.Accounts

  @create_attrs %{name: "John", email: "john@test.com", password: "password"}

  test "index/2 response with all Users", %{conn: conn} do
    users = [%{name: "John", email: "john@test.com", password: "password"},
             %{name: "Jane", email: "jane@test.com", password: "password"}]

    [{:ok, user1},{:ok, user2}] = Enum.map(users, &Accounts.create_user(&1))

    response =
      conn
      |> get(user_path(conn, :index))
      |> json_response(200)

    expected = %{
      "data" => [
          %{ "name" => user1.name, "email" => user1.email },
          %{ "name" => user2.name, "email" => user2.email }
       ]
    }

    assert response == expected
  end

  describe "create/2" do
    test "Creates, and responds with a newly created user if attributes are valid"
    test "Returns an error and does not create a user if attributes are invalid"
  end

  describe "show/2" do
    setup [:create_user]
    test "Responds with user info if the user is found", %{conn: conn, user: user} do
      response =
        conn
        |> get(user_path(conn, :show, user.id))
        |> json_response(200)

      expected = %{"data" => %{"email" => user.email, "name" => user.name}}

      assert response == expected
    end
    test "Responds with a message indicating user not found", %{conn: conn} do
      response =
        conn
        |> get(user_path(conn, :show, -1))
        |> text_response(404)

      assert response =~ "User not found"
    end
  end

  describe "update/2" do
    test "Edits, and responds with the user if attributes are valid"
    test "Returns an error and does not edit the user if attributes are invalid"
  end

  test "delete/2 and responds with :ok if the user was deleted"

  defp create_user(_) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    {:ok, user: user}
  end
end
