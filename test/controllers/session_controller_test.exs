defmodule PhoenixTemplate.SessionControllerTest do
  use PhoenixTemplate.ConnCase
  alias PhoenixTemplate.User

  setup do
    User.update_changeset(%User{},
    %{
      username: "jk",
      password: "supersecret",
      password_confirmation: "supersecret",
      email: "jk@example.com",
      role: :admin
    })
    |> Repo.insert!
    {:ok, conn: build_conn()}
  end

  test "shows the login form", %{conn: conn} do
    conn = get conn, session_path(conn, :new)
    assert html_response(conn, 200) =~ "Login"
  end

  test "creates a new user session for a valid user", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: %{email: "jk@example.com", password: "supersecret"}
    assert get_session(conn, :current_user)
    assert get_flash(conn, :info) == "Successfully logged in!"
    assert redirected_to(conn) == page_path(conn, :index)
  end

  test "does not create a session with a bad login", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: %{email: "jk@example.com", password: "wrong"}
    refute get_session(conn, :current_user)
    assert get_flash(conn, :error) == "Sorry, we didn't recognise that email and password combination!"
    assert redirected_to(conn) == session_path(conn, :new)
  end

  test "does not create a session if user does not exist", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: %{username: "wrong", password: "supersecret"}
    assert get_flash(conn, :error) == "Sorry, we didn't recognise that email and password combination!"
    assert redirected_to(conn) == session_path(conn, :new)
  end

  test "deletes the user session", %{conn: conn} do
    user = Repo.get_by(User, %{email: "jk@example.com"})
    conn = delete conn, session_path(conn, :delete, user)
    refute get_session(conn, :current_user)
    assert get_flash(conn, :info) == "Successfully logged out!"
    assert redirected_to(conn) == page_path(conn, :index)
  end
end
