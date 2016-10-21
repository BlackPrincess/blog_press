defmodule BlogPress.Repo.Migrations.CreateTaxonomy do
  use Ecto.Migration

  def change do
    create table(:taxonomies) do
      add :code, :string, default: "", uniq: true
      add :name, :string, default: ""

      timestamps()
    end
    
    create unique_index(:taxonomies, [:code])
  end
end
