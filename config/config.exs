# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_template,
  ecto_repos: [PhoenixTemplate.Repo]

# Configures the endpoint
config :phoenix_template, PhoenixTemplate.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sx66Rx02vs3EifufWEqx/YP5PDmUpVoukicabfS3bA1F56pZAiZPNfeuwRwPu94S",
  render_errors: [view: PhoenixTemplate.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixTemplate.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

config :ex_admin,
  theme_selector: [
    {"AdminLte",  ExAdmin.Theme.AdminLte2},
    {"ActiveAdmin", ExAdmin.Theme.ActiveAdmin}
  ],
  repo: PhoenixTemplate.Repo,
  module: PhoenixTemplate,
  modules: [
    PhoenixTemplate.ExAdmin.Dashboard,
    PhoenixTemplate.ExAdmin.User
  ]

config :xain, :after_callback, {Phoenix.HTML, :raw}
