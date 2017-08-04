defmodule Foody.ProductController do
  use Foody.Web, :controller

  alias Foody.Product

  def index(conn, _params) do
    products = Product
      |> order_by(:expires_at)
      |> Repo.all

    render(conn, "index.json", products: products)
  end
end
