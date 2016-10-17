defmodule BlogPress.AdminUser do
  use BlogPress.Web, :model

  schema "admin_users" do
    field :name, :string
    field :email, :string
    field :password_encrypted, :string
    
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
    |> put_change(:password_encrypted, hashed_password(params[:password]))
  end

  def authenticate(admin_user, password) do
    case admin_user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, admin_user.password_encrypted)
    end
  end
  
  def hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
