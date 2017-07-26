defmodule Foody.TypeControllerTest do
  use Foody.ConnCase, async: true

  test "lists all types sorted by name on index", %{conn: conn} do
    type_two = insert_type(%{name: "two"})
    type_one = insert_type(%{name: "one"})

    conn = get conn, type_path(conn, :index)
    assert json_response(conn, 200) == %{
      "types" => [
        %{
          "id" => type_one.id,
          "name" => type_one.name
        },
        %{
          "id" => type_two.id,
          "name" => type_two.name
        }
      ]
    }
  end
end
