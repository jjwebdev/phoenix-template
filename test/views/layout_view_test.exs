defmodule PhoenixTemplate.LayoutViewTest do
  use PhoenixTemplate.ConnCase, async: true

  alias PhoenixTemplate.LayoutView
  alias PhoenixTemplate.User

  setup do
    User.changeset(%User{},
    %{
      password: "supersecret",
      password_confirmation: "supersecret",
      email: "jk@example.com",
      role: 0
    })
    |> Repo.insert
    {:ok, conn: build_conn()}
  end

  test "current user returns the user in the session", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: %{email: "jk@example.com", password: "supersecret"}
    assert LayoutView.current_user(conn)
  end

  test "current user returns nothing if there is no user in the session", %{conn: conn} do
    user = Repo.get_by(User, %{email: "jk@example.com"})
    conn = delete conn, session_path(conn, :delete, user)
    refute LayoutView.current_user(conn)
  end
end
