defmodule BlogPress.Repo.Migrations.CreateAdminUser do
  use Ecto.Migration

  def change do
    create table(:admin_users) do
      add :name, :string, default: ""
      add :email, :string, default: ""
      add :password_encrypted, :string, default: ""

      timestamps()
    end

  end
end
