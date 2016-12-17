defmodule PhoenixTemplate.UserListTest do
  use PhoenixTemplate.AcceptanceCase, async: true

  def sign_in_as_admin(session) do
      session
      |> visit("/")
      |> click_link("Sign In")
      |> fill_in("E-mail", with: "admin@example.com")
      |> fill_in("Password", with: "password")
      |> find("#user_submit")
      |> click
  end

  test "admin can see user", %{session: session} do
    first_employee =
      session
      |> sign_in_as_admin
      |> visit("/users")
      |> all(".user")
      |> List.first
      |> find(".user-name")
      |> text

    assert first_employee == "Chris"
  end
end
