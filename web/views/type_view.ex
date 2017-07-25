defmodule Foody.TypeView do
  use Foody.Web, :view

  def render("index.json", %{types: types}), do: types
end
