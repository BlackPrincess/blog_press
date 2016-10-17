# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_press,
  ecto_repos: [BlogPress.Repo]

# Configures the endpoint
config :blog_press, BlogPress.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BlbSD3ux9QBiOcPPaXj8XgPIP3k+6Y+aAI7AN5IR9L8uxUsDm0kF4Ms6WVcgoTrs",
  render_errors: [view: BlogPress.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BlogPress.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures template engines
config :phoenix, :template_engines, haml: PhoenixHaml.Engine

# Configures gurdian
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "BlogPress",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "secret_key", # FIXME: Secret key
  serializer: BlogPress.GuardianSerializer

# Configures comeonin
config :comeonin, :bcrypt_log_rounds, 4

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
