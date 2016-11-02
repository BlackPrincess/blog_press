defmodule BlogPress.Admin.Api.ArticlesView do
  use BlogPress.Web, :view
  
  def render("index.json", %{articles: articles}) do
    render_many(articles, BlogPress.Admin.Api.ArticlesView, "simple.json")
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
  
  def render("simple.json", %{articles: article}) do
    %{id: article.id,
      title: article.title,
      permalink: article.permalink,
      published_at: article.published_at,
      created_at: article.inserted_at,
      updated_at: article.updated_at
    }
  end
  
  # TODO
  def render("error.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {f, err} -> { f, translate_error(err)} end) 
    %{status: "error", 
      messages: Enum.into(errors, %{})
    }
  end
  
  def render("created.json", %{article: article}) do
    %{
      status: "success",
      data: render_one(article, BlogPress.Admin.Api.ArticlesView, "article.json")
    }
  end
end
