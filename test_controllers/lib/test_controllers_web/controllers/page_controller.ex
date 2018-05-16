defmodule TestControllersWeb.PageController do
  use TestControllersWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
