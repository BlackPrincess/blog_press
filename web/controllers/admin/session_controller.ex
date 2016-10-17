defmodule BlogPress.Admin.SessionController do
  use BlogPress.Web, :admin_controller
  
  alias BlogPress.AdminUser
  
  plug :put_layout, {BlogPress.Admin.LayoutView, "admin.html"}
  
  def login(conn, _params, _user \\ nil, _claims \\ nil) do
    render conn, "login.html"
  end
  
  def create(conn, params, _user, _claims) do
    # TODO: 
    user = AdminUser
      |> where([a], a.email == ^params["login_params"]["email"])
      |> first
      |> Repo.one
      
    
    if AdminUser.authenticate(user, params["login_params"]["password"]) do
      clear_session(conn)
      conn 
        |> Guardian.Plug.sign_in(user, :access, %{key: :admin})
        |> login_after
    else
      login_after(conn)
    end
  end
  
  def destroy(conn, _params, _user, _claims) do
    conn 
      |> Guardian.Plug.sign_out(:admin)
      |> logout_after
  end
  
  def login_after(conn) do
    redirect conn, to: admin_page_path(conn, :index)
  end
  
  def logout_after(conn) do
    redirect conn, to: admin_session_path(conn, :login)
  end
end
