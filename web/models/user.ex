defmodule PhoenixTemplate.User do
  use PhoenixTemplate.Web, :model
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_digest, :string
    field :role, RoleEnum

    has_many :posts, PhoenixTemplate.Post

    timestamps()

    # Virtual Fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_confirmation, :role])
    |> unique_constraint(:email)
    |> validate_confirmation(:password, message: "does not match password!")
    |> validate_length(:password, message: "password must be at least 7 characters", min: 7)
    |> validate_required([:email, :password, :password_confirmation, :role])
    |> hash_password
  end

  def registration_changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:email, :password, :password_confirmation])
      |> validate_required([:email, :password, :password_confirmation])
      |> hash_password
    end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_digest, hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
