defmodule BlogPress.PageController do
  use BlogPress.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
