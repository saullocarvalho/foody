defmodule Foody.ProductsChannel do
  use Phoenix.Channel
  alias Foody.Repo
  alias Foody.Type

  require Logger

  def join("products", _, socket), do: {:ok, socket}
end
