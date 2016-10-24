defmodule BlogPress.Admin.Api.ArticlesController do
  use BlogPress.Web, :admin_controller
  
  alias BlogPress.Article
  
  plug :put_layout, false
  plug Guardian.Plug.EnsureAuthenticated, [key: :admin]

  def create(conn, %{"article" => article_params}, _user, _claims) do
    
    changeset = article_params 
      |> Enum.map(fn {k,v} -> {Mix.Utils.underscore(k), v} end)
      |> Enum.into(%{})
      |> (fn (a) -> Article.changeset(%Article{}, a) end).()
    
    case Repo.insert(changeset) do
      {:ok, changeset} ->
        render(conn, "created.json", article: changeset)
      {:error, changeset} ->
        render(conn, "error.json", changeset: changeset)
    end
  end
end
