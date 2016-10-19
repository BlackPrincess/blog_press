defmodule BlogPress.Admin.Api.TaxonomiesView do
  use BlogPress.Web, :view
  
  def render("index.json", %{taxonomies: taxonomies}) do
    render_many(taxonomies, BlogPress.Admin.Api.TaxonomiesView, "taxonomy.json")
  end
  
  def render("taxonomy.json", %{taxonomies: taxonomy}) do
    %{id: taxonomy.id,
      code: taxonomy.code,
      name: taxonomy.name,
      created_at: taxonomy.inserted_at,
      updated_at: taxonomy.updated_at
    }
  end
  
  # TODO
  def render("error.json", %{changeset: changeset}) do
    %{ messages: "error" }
  end
end
