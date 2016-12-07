defmodule PhoenixTemplate.Router do
  use PhoenixTemplate.Web, :router

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

  scope "/", PhoenixTemplate do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  forward("/api", Absinthe.Plug, schema: PhoenixTemplate.Schema)
  forward("/graphiql", Absinthe.Plug.GraphiQL, schema: PhoenixTemplate.Schema)
  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTemplate do
  #   pipe_through :api
  # end
end
