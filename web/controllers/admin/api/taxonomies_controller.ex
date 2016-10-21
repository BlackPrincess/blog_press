defmodule BlogPress.Admin.Api.TaxonomiesController do
  use BlogPress.Web, :admin_controller
  
  alias BlogPress.Taxonomy
  
  plug :put_layout, false
  plug Guardian.Plug.EnsureAuthenticated, [key: :admin]

  def index(conn, _params, _user, _claims) do
    taxonomies = Taxonomy |> Repo.all
    
    render conn, "index.json", %{taxonomies: taxonomies}
  end
  
  def create(conn, %{"taxonomy" => taxonomy_params}, _user, _claims) do
    changeset = Taxonomy.changeset(%Taxonomy{}, taxonomy_params)
    
    case Repo.insert(changeset) do
      {:ok, changeset} ->
        render(conn, "created.json", taxonomy: changeset)
      {:error, changeset} ->
        render(conn, "error.json", changeset: changeset)
    end
  end
end
