defmodule PhoenixTemplate.UserIndexTest do
  use ExUnit.Case, async: true
  use PhoenixTemplate.AcceptanceCase, async: true

  import PhoenixTemplate.Factory
  alias PhoenixTemplate.Helpers

  test "admin can see user", %{session: session} do
    build(:user)
    |> make_admin
    |> hash_password
    |> insert

    build(:user)
    |> make_member
    |> hash_password
    |> insert

    first_user_email =
      session
      |> Helpers.sign_in_as_admin
      |> visit("/users")
      |> all(".user")
      |> List.first
      |> find(".useremail")
      |> text

    assert first_user_email == "admin@example.com"
  end
end
