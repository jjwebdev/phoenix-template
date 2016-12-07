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

Repo.insert!(%User{email: "ryan@ryan.com"})
Repo.insert!(%User{email: "rosie@mydog.com"})

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
