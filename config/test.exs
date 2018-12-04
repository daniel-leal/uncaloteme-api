use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :uncalote_me, UncaloteMeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :uncalote_me, UncaloteMe.Repo,
  username: "leal",
  password: "123",
  database: "uncalote_me_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
