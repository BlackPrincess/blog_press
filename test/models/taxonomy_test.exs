defmodule BlogPress.TaxonomyTest do
  use BlogPress.ModelCase

  alias BlogPress.Taxonomy

  @valid_attrs %{code: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Taxonomy.changeset(%Taxonomy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Taxonomy.changeset(%Taxonomy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
