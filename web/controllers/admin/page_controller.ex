defmodule BlogPress.Admin.PageController do
  use BlogPress.Web, :controller
  
  plug :put_layout, {BlogPress.Admin.LayoutView, "admin.html"}

  def index(conn, _params) do
    render conn, "index.html"
  end
end
