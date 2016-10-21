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
    errors = Enum.map(changeset.errors, fn {f, err} -> {f, translate_error(err)} end) 
    %{status: "error", 
      messages: Enum.into(errors, %{})
    }
  end
  
  def render("created.json", %{taxonomy: taxonomy}) do
    %{
      status: "success",
      data: render_one(taxonomy, BlogPress.Admin.Api.TaxonomiesView, "taxonomy.json")
    }
  end
end
