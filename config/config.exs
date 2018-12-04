# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :uncalote_me,
  ecto_repos: [UncaloteMe.Repo]

# Configures the endpoint
config :uncalote_me, UncaloteMeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kTp8MHeW3DuujScInuY2t9zu2DpeRyMaSuizC9p+dMcPvMU8Bj4u0e9qapeFO/qB",
  render_errors: [view: UncaloteMeWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: UncaloteMe.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
