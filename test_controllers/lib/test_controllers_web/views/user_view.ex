defmodule TestControllersWeb.UserView do
  use TestControllersWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, TestControllersWeb.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{name: user.name, email: user.email}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, TestControllersWeb.UserView, "user.json")}
  end
end
