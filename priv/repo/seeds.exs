# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixTemplate.Repo.insert!(%PhoenixTemplate.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixTemplate.User
alias PhoenixTemplate.Repo

admin = User.changeset(%User{}, %{
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password",
    role: :admin
  })

member = User.changeset(%User{}, %{
    email: "member@example.com",
    password: "password",
    password_confirmation: "password",
    role: :member
  })

case Repo.insert_or_update admin do

  {:error, changeset} ->
    IO.puts("Error seeding admin user")
    IO.inspect(changeset.errors)
  {:ok, _} ->
    IO.puts("Successfully seeded admin user")
end

case Repo.insert_or_update member do
  {:error, changeset} ->
    IO.puts("Error seeding member user")
    IO.inspect(changeset.errors)
  {:ok, _} ->
    IO.puts("Successfully seeded member user")
end
