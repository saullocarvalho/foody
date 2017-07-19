defmodule Foody.TypeRepoTest do
  use Foody.ModelCase
  alias Foody.Type

  @valid_attrs %{name: "some type"}

  test "converts unique_constraint on name to error" do
    insert_type(%{name: "same type"})
    attrs = Map.put(@valid_attrs, :name, "same type")
    changeset = Type.changeset(%Type{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert { :name, {"has already been taken", []} } in changeset.errors
  end
end
