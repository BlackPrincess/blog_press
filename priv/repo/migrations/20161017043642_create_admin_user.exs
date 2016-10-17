defmodule BlogPress.Repo.Migrations.CreateAdminUser do
  use Ecto.Migration

  def change do
    create table(:admin_users) do
      add :name, :string
      add :email, :string
      add :password_encrypted, :string

      timestamps()
    end

  end
end
