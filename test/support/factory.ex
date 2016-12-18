defmodule PhoenixTemplate.Factory do
  use ExMachina.Ecto, repo: PhoenixTemplate.Repo
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]
  use PhoenixTemplate.Web, :model

  def user_factory do
    %PhoenixTemplate.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      password: "password",
      password_confirmation: "password"
    }
  end

  def hash_password(user) do
    password = Map.get(user, :password)
    %{user | password_digest: hashpwsalt(password)}
  end

  def make_admin(user) do
    %{user | email: "admin@example.com", role: :admin}
  end

  def make_member(user) do
    %{user | email: sequence(:email, &"email-#{&1}@example.com"), role: :member}
  end
end
