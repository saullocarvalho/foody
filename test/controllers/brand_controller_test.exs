defmodule Foody.BrandControllerTest do
  use Foody.ConnCase, async: true

  test "lists all brands sorted by name on index", %{conn: conn} do
    brand_two = insert_brand(%{name: "two"})
    brand_one = insert_brand(%{name: "one"})

    conn = get conn, brand_path(conn, :index)
    assert json_response(conn, 200) == %{
      "brands" => [
        %{
          "id" => brand_one.id,
          "name" => brand_one.name
        },
        %{
          "id" => brand_two.id,
          "name" => brand_two.name
        }
      ]
    }
  end
end
