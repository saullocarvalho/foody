defmodule Foody.TypeView do
  use Foody.Web, :view

  def render("index.json", %{types: types}), do: %{types: types}

  def render("show.json", %{type: type}), do: type
end
