defmodule HelloApi.HelloController do
  use HelloApi.Web, :controller

  def index(conn, _params) do
    json conn, "Hello World"
  end
end
