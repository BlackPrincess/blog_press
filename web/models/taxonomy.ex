defmodule BlogPress.Taxonomy do
  use BlogPress.Web, :model

  schema "taxonomies" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:code, :name])
    |> validate_required([:code, :name])
    |> unique_constraint(:code)
  end
end
