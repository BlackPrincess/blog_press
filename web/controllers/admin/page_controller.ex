defmodule BlogPress.Admin.PageController do
  use BlogPress.Web, :admin_controller
  
  plug :put_layout, {BlogPress.Admin.LayoutView, "admin.html"}
  plug Guardian.Plug.EnsureAuthenticated, [key: :admin]

  def index(conn, _params, _user, _claims) do
    render conn, "index.html"
  end
end
