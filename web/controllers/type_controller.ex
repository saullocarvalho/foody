defmodule Foody.TypeController do
  use Foody.Web, :controller

  alias Foody.Type

  def index(conn, _params) do
    types = Type
      |> order_by(:name)
      |> Repo.all

    render(conn, "index.json", types: types)
  end

  def create(conn, params) do
    changeset = Type.changeset(%Type{}, params)

    case Repo.insert(changeset) do
      {:ok, type} ->
        conn
        |> render("show.json", type: type)
      {:error, changeset} ->
        conn
    end
  end

  def delete(conn, %{"id" => id}) do
    type = Repo.get!(Type, id)
    Repo.delete!(type)

    render(conn, "show.json", type: type)
  end
end
