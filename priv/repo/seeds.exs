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

changeset = %User{username: "admin", email: "admin@example.com"}

Repo.insert! changeset


# PhoenixTemplate.Repo.insert_or_update!(%PhoenixTemplate.User{
#   username: "member",
#   email: "member@example.com",
#   password: "password"
# })
