# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :speclixir,
  ecto_repos: [Speclixir.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :speclixir, SpeclixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qg1zL8saqQ4rJJwL8AvA1Kr6yScVjHBMWJ7nRbuxvIHYebG39tRbkzGK95sACqP+",
  render_errors: [view: SpeclixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Speclixir.PubSub,
  live_view: [signing_salt: "L6ylLx4J"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
