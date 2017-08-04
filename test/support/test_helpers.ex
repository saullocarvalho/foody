defmodule Foody.TestHelpers do
  alias Foody.Repo

  def insert_type(attrs \\ %{}) do
    %Foody.Type{}
    |> Foody.Type.changeset(attrs)
    |> Repo.insert!()
  end

  def insert_brand(attrs \\ %{}) do
    %Foody.Brand{}
    |> Foody.Brand.changeset(attrs)
    |> Repo.insert!()
  end

  def insert_product(type, brand, attrs \\ %{}) do
    type
    |> Ecto.build_assoc(:products, brand_id: brand.id)
    |> Foody.Product.changeset(attrs)
    |> Repo.insert!()
  end
end
