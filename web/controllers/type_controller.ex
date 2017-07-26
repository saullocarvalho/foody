defmodule Foody.TypeController do
  use Foody.Web, :controller

  alias Foody.Type

  def index(conn, _params) do
    types = Type
      |> order_by(:name)
      |> Repo.all

    render conn, types: types
  end

  def create(conn, params) do
    IO.puts params
  end
end
