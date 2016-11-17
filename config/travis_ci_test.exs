use Mix.Config
config :phoenix_template, PhoenixTemplate.Endpoint,
  http: [port: 4001],
  server: false
config :logger, level: :warn
config :comeonin, bcrypt_log_rounds: 4
config :phoenix_template, PhoenixTemplate.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "travis_ci_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
