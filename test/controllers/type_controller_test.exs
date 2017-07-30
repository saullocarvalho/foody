defmodule Foody.TypeControllerTest do
  use Foody.ConnCase, async: true
  alias Foody.Type

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

  test "creates the type and returns it", %{conn: conn} do
    count_before = Repo.one(from t in Type, select: count "*")
    conn = post conn, type_path(conn, :create, %{"name" => "two"})
    response = %{"id" => id} = json_response(conn, 200)

    assert response == %{
      "id" => id,
      "name" => "two"
    }
    assert count_before + 1 == Repo.one(from t in Type, select: count "*")
  end

  test "updates the type and returns it", %{conn: conn} do
    type_two = insert_type(%{name: "two"})
    _type_one = insert_type(%{name: "one"})
    count_before = Repo.one(from t in Type, select: count "*")

    conn = put conn, type_path(conn, :update, type_two.id, %{"name" => "three"})
    assert json_response(conn, 200) == %{
      "id" => type_two.id,
      "name" => "three"
    }
    assert count_before == Repo.one(from t in Type, select: count "*")
  end

  test "deletes the type and returns it", %{conn: conn} do
    type_two = insert_type(%{name: "two"})
    _type_one = insert_type(%{name: "one"})
    count_before = Repo.one(from t in Type, select: count "*")

    conn = delete conn, type_path(conn, :delete, type_two.id)
    assert json_response(conn, 200) == %{
      "id" => type_two.id,
      "name" => type_two.name
    }
    assert count_before == Repo.one(from t in Type, select: count "*")+1
  end
end
