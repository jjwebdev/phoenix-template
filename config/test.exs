use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_template, PhoenixTemplate.Endpoint,
  http: [port: 4001],
  server: true

config :phoenix_template, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

config :comeonin, bcrypt_log_rounds: 4

# Configure your database
config :phoenix_template, PhoenixTemplate.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "test",
  password: "test",
  database: "phoenix_template_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wallaby, screenshot_on_failure: true
