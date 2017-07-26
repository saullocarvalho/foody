defmodule Foody.BrandController do
  use Foody.Web, :controller

  alias Foody.Brand

  def index(conn, _params) do
    brands = Brand
      |> order_by(:name)
      |> Repo.all

    render conn, brands: brands
  end
end
