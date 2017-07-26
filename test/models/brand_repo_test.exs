defmodule Foody.BrandRepoTest do
  use Foody.ModelCase
  alias Foody.Brand

  @valid_attrs %{name: "some brand"}

  test "converts unique_constraint on name to error" do
    insert_brand(%{name: "same brand"})
    attrs = Map.put(@valid_attrs, :name, "same brand")
    changeset = Brand.changeset(%Brand{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert { :name, {"has already been taken", []} } in changeset.errors
  end
end
