defmodule Foody.PageControllerTest do
  use Foody.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello Foody!"
  end
end
