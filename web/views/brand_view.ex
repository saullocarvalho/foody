defmodule Foody.BrandView do
  use Foody.Web, :view

  def render("index.json", %{brands: brands}), do: %{brands: brands}

  def render("show.json", %{brand: brand}), do: brand
end
