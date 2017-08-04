defmodule Foody.ProductRepoTest do
  use Foody.ModelCase
  alias Foody.Product

  @valid_type_attrs %{name: "some type"}
  @valid_brand_attrs %{name: "some brand"}
  @valid_expire_date %{expires_at: "2018-01-01"}

  test "converts assoc_constraint on type to error" do
    type = insert_type(@valid_type_attrs)
    brand = insert_brand(@valid_brand_attrs)
    Repo.delete(type)
    attrs = Map.merge(%{type_id: type.id, brand_id: brand.id}, @valid_expire_date)
    changeset = Product.changeset(%Product{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert [type: { "does not exist", [] }] == changeset.errors
  end

  test "converts assoc_constraint on brand to error" do
    type = insert_type(@valid_type_attrs)
    brand = insert_brand(@valid_brand_attrs)
    Repo.delete(brand)
    attrs = Map.merge(%{type_id: type.id, brand_id: brand.id}, @valid_expire_date)
    changeset = Product.changeset(%Product{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert [brand: { "does not exist", [] }] == changeset.errors
  end
end
