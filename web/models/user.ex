defmodule PhoenixTemplate.User do
  use PhoenixTemplate.Web, :model
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_digest, :string
    field :role, RoleEnum

    timestamps()

    # Virtual Fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_confirmation, :role])
    |> unique_constraint(:email)
    |> validate_confirmation(:password, message: "does not match password!")
    |> validate_length(:password, message: "password must be at least 7 characters", min: 7)
    |> validate_required([:email, :password, :password_confirmation, :role])
    |> hash_password
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      changeset
      |> put_change(:password_digest, hashpwsalt(password))
    else
      changeset
    end
  end
end
