defmodule Foody.ProductController do
  use Foody.Web, :controller
  import Ecto.Query

  alias Foody.Product

  def index(conn, _params) do
    products = Repo.all(from p in Product,
                        join: b in assoc(p, :brand),
                        join: t in assoc(p, :type),
                        group_by: [b.id, t.id, p.expires_at],
                        where: p.consumed == false,
                        select: %{count: count(p.id), brand: b, type: t, expires_at: p.expires_at},
                        order_by: p.expires_at)

    render(conn, "index.json", products: products)
  end
end
