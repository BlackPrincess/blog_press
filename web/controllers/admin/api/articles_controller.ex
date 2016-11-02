defmodule BlogPress.Admin.Api.ArticlesController do
  use BlogPress.Web, :admin_controller
  
  alias BlogPress.Article
  
  plug :put_layout, false
  plug Guardian.Plug.EnsureAuthenticated, [key: :admin]
  
  def index(conn, _params, _user, _claims) do
    render conn, "index.json", %{articles: Article |> Repo.all}
  end

  def create(conn, %{"article" => article_params}, _user, _claims) do
    
    changeset = Article.changeset(%Article{}, article_params)
    
    case Repo.insert(changeset) do
      {:ok, changeset} ->
        render(conn, "created.json", article: changeset)
      {:error, changeset} ->
        render(conn, "error.json", changeset: changeset)
    end
  end
end
