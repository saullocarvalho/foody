defmodule Foody.BrandController do
  use Foody.Web, :controller

  alias Foody.Brand

  def index(conn, _params) do
    brands = Brand
      |> order_by(:name)
      |> Repo.all

    render conn, brands: brands
  end

  def create(conn, params) do
    changeset = Brand.changeset(%Brand{}, params)

    case Repo.insert(changeset) do
      {:ok, brand} ->
        conn
        |> render("show.json", brand: brand)
      {:error, _changeset} ->
        conn
    end
  end

  def update(conn, brand_params = %{"id" => id}) do
    brand = Repo.get!(Brand, id)
    changeset = Brand.changeset(brand, brand_params)

    case Repo.update(changeset) do
      {:ok, brand} ->
        conn
        |> render("show.json", brand: brand)
      {:error, _changeset} ->
        conn
    end
  end

  def delete(conn, %{"id" => id}) do
    brand = Repo.get!(Brand, id)
    Repo.delete!(brand)

    conn
    |> render("show.json", brand: brand)
  end

end
