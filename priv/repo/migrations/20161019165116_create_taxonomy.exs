defmodule BlogPress.Repo.Migrations.CreateTaxonomy do
  use Ecto.Migration

  def change do
    create table(:taxonomies) do
      add :code, :string, default: ""
      add :name, :string, default: ""

      timestamps()
    end

  end
end
