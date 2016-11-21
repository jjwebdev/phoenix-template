defmodule PhoenixTemplate.PageControllerTest do
  use PhoenixTemplate.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello PhoenixTemplate!"
  end
end
