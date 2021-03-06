defmodule Foody.Router do
  use Foody.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Foody do
    pipe_through :api

    resources "/types", TypeController, except: [:new, :edit]
    resources "/brands", BrandController, except: [:new, :edit]
    resources "/products", ProductController, only: [:index, :create]
  end

  scope "/", Foody do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Foody do
  #   pipe_through :api
  # end
end
