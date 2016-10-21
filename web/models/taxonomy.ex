defmodule BlogPress.Taxonomy do
  use BlogPress.Web, :model

  schema "taxonomies" do
    field :code, :string, uniq: true
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
      |> cast(params, [:code, :name])
      |> unique_constraint(:code)
      |> validate_required([:code, :name])
      |> validate_length(:code, max: 100)
      |> validate_length(:name, max: 100)
    
  end
end
