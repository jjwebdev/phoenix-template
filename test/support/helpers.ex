defmodule PhoenixTemplate.Helpers do
  use Wallaby.DSL
  def sign_in_as_admin(session) do
    session
    |> visit("/")
    |> click_link("Sign In")
    |> fill_in("E-mail", with: "admin@example.com")
    |> fill_in("Password", with: "password")
    |> find("#user_submit")
    |> click
  end
end
