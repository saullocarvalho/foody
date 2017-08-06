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
                        select: %{productBrand: b, productType: t, count: count(p.id), expiresAt: p.expires_at},
                        order_by: p.expires_at)

    render(conn, "index.json", products: products)
  end

  def create(conn, params = %{"consumed" => true, "brand_id" => brand_id, "type_id" => type_id, "expires_at" => expires_at}) do
    product = Repo.one(from p in Product,
                       where: p.consumed == false and p.brand_id == ^brand_id and p.type_id == ^type_id and p.expires_at == ^expires_at,
                       limit: 1)

    product_count = Repo.one(from p in Product,
                            join: b in assoc(p, :brand),
                            join: t in assoc(p, :type),
                            group_by: [b.id, t.id, p.expires_at],
                            where: p.consumed == false and p.brand_id == ^product.brand_id and p.type_id == ^product.type_id and p.expires_at == ^product.expires_at,
                            select: %{productBrand: b, productType: t, count: count(p.id), expiresAt: p.expires_at})

    changeset = Product.consume_changeset(product, params)
    case Repo.update(changeset) do
      {:ok, product} ->
        product_count = %{ product_count | count: product_count.count - 1}

        conn
        |> render("show.json", product: product_count)
      {:error, _changeset} ->
        conn
    end
  end
  def create(conn, params) do
    changeset = Product.changeset(%Product{}, params)

    case Repo.insert(changeset) do
      {:ok, product} ->
        product_count = Repo.one(from p in Product,
                                 join: b in assoc(p, :brand),
                                 join: t in assoc(p, :type),
                                 group_by: [b.id, t.id, p.expires_at],
                                 where: p.consumed == false and p.brand_id == ^product.brand_id and p.type_id == ^product.type_id and p.expires_at == ^product.expires_at,
                                 select: %{productBrand: b, productType: t, count: count(p.id), expiresAt: p.expires_at})
        conn
        |> render("show.json", product: product_count)
      {:error, _changeset} ->
        conn
    end
  end
end
