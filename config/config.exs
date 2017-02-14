# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mail_ex,
  ecto_repos: [MailEx.Repo]

# Configures the endpoint
config :mail_ex, MailEx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZSU+mE65frj7HExdgK5qfeTFKIAgHw4zII5nYQeza1gCetXBR8Q7gbbNluyiST/O",
  render_errors: [view: MailEx.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MailEx.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :mail_ex, MailEx.Mailer,
  adapter: Bamboo.SendgridAdapter,
  api_key: System.get_env("SENDGRID_APIKEY")

config :mail_ex, MailEx.SwooshMailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("SENDGRID_APIKEY")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
