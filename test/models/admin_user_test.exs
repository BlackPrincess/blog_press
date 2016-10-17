defmodule BlogPress.AdminUserTest do
  use BlogPress.ModelCase

  alias BlogPress.AdminUser

  @valid_attrs %{email: "some content", name: "some content", password_encrypted: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AdminUser.changeset(%AdminUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AdminUser.changeset(%AdminUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
