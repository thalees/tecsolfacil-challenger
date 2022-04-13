# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :tecsolfacil,
  ecto_repos: [Tecsolfacil.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :tecsolfacil, TecsolfacilWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: TecsolfacilWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Tecsolfacil.PubSub,
  live_view: [signing_salt: "02Re/fNT"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :tecsolfacil, Tecsolfacil.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :tecsolfacil, Tecsolfacil.Guardian,
  issuer: "tecsolfacil",
  secret_key: "i7V08yillqh+9V165FKxAS1r4r+uvGN5zUNYeQ8N9UxyxIZDYGucF7ho5Ikk5pdz"
