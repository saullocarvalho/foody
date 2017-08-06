defmodule Foody.ProductView do
  use Foody.Web, :view

  def render("index.json", %{products: products}), do: %{products: products}

  def render("show.json", %{product: product}), do: product
end
