# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_service,
  ecto_repos: [ApiService.Repo]

# Configures the endpoint
config :api_service, ApiServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OAlmx6S3k8t9VCuvSwqV+rUpIzuBxU8O5W73w27Zr4RThn4osUFN9uo0nlub8aNN",
  render_errors: [view: ApiServiceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ApiService.PubSub,
  live_view: [signing_salt: "82PSjrjl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
