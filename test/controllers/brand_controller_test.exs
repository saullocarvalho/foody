defmodule Foody.BrandControllerTest do
  use Foody.ConnCase, async: true
  alias Foody.Brand

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

  test "creates the brand and returns it", %{conn: conn} do
    count_before = Repo.one(from b in Brand, select: count "*")
    conn = post conn, brand_path(conn, :create, %{"name" => "two"})
    response = %{"id" => id} = json_response(conn, 200)

    assert response == %{
      "id" => id,
      "name" => "two"
    }
    assert count_before+1 == Repo.one(from b in Brand, select: count "*")
  end

  test "updates the brand and returns it", %{conn: conn} do
    brand_two = insert_brand(%{name: "two"})
    _brand_one = insert_brand(%{name: "one"})
    count_before = Repo.one(from b in Brand, select: count "*")

    conn = put conn, brand_path(conn, :update, brand_two.id, %{"name" => "three"})
    assert json_response(conn, 200) == %{
      "id" => brand_two.id,
      "name" => "three"
    }
    assert count_before == Repo.one(from b in Brand, select: count "*")
  end

  test "deletes the brand and returns it", %{conn: conn} do
    brand_two = insert_brand(%{name: "two"})
    _brand_one = insert_brand(%{name: "one"})
    count_before = Repo.one(from b in Brand, select: count "*")

    conn = delete conn, brand_path(conn, :delete, brand_two.id)
    assert json_response(conn, 200) == %{
      "id" => brand_two.id,
      "name" => brand_two.name
    }
    assert count_before == Repo.one(from b in Brand, select: count "*")+1
  end
end
