defmodule Foody.ProductTest do
  use Foody.ModelCase

  alias Foody.Product

  @valid_attrs %{type_id: 1, brand_id: 2, expires_at: "2018-01-01"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
