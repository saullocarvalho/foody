defmodule Foody.PageController do
  use Foody.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
