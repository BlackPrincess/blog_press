defmodule BlogPress.Admin.Api.ArticlesView do
  use BlogPress.Web, :view
  
  def render("index.json", %{articles: articles}) do
    render_many(articles, BlogPress.Admin.Api.ArticlesView, "article.json")
  end
  
  def render("article.json", %{articles: article}) do
    %{id: article.id,
      title: article.title,
      permalink: article.permalink,
      originalBody: article.original_body,
      bodyHtml: article.body_html,
      publishedAt: article.published_at,
      createdAt: article.inserted_at,
      updatedAt: article.updated_at
    }
  end
  
  # TODO
  def render("error.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {f, err} -> { f |> Atom.to_string |> lower_camelize, translate_error(err)} end) 
    %{status: "error", 
      messages: Enum.into(errors, %{})
    }
  end
  
  # TODO
  @spec lower_camelize(String.t) :: String.t
  def lower_camelize(s) do
    # https://github.com/elixir-lang/elixir/issues/3850
    s 
      |> Mix.Utils.camelize 
      |> String.Casing.titlecase_once 
      |> (fn {x,xs} -> String.downcase(x) <> xs end).()
  end
  
  def render("created.json", %{article: article}) do
    %{
      status: "success",
      data: render_one(article, BlogPress.Admin.Api.ArticlesView, "article.json")
    }
  end
end
