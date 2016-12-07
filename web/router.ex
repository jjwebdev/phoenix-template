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

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug PhoenixTemplate.Web.Context
  end

  scope "/", PhoenixTemplate do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
  scope "/api" do
    pipe_through :graphql
    forward "/", Absinthe.Plug, schema: PhoenixTemplate.Schema
  end
  forward("/graphiql", Absinthe.Plug.GraphiQL, schema: PhoenixTemplate.Schema)
  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTemplate do
  #   pipe_through :api
  # end
end
