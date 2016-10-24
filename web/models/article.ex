defmodule BlogPress.Article do
  use BlogPress.Web, :model

  schema "articles" do
    field :title, :string, default: ""
    field :permalink, :string, default: ""
    field :original_body, :string, default: ""
    field :body_html, :string, default: ""
    field :published_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :permalink, :original_body, :body_html, :published_at])
    |> validate_required([:title, :permalink, :original_body, :published_at]) # body_html
    |> unique_constraint(:permalink)
  end
end
