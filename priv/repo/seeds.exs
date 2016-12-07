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
alias PhoenixTemplate.Post
alias PhoenixTemplate.Repo

admin = User.update_changeset(%User{}, %{
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password",
    role: :admin
  })

member = User.update_changeset(%User{}, %{
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

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
