defmodule BlogPress.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string, default: ""
      add :permalink, :string, default: "", uniq: true
      add :original_body, :text
      add :body_html, :text
      add :published_at, :datetime

      timestamps()
    end

  end
end
