# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tasktracker2,
  ecto_repos: [Tasktracker.Repo]

# Configures the endpoint
config :tasktracker2, TasktrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2APVIXi9ki2GhaB7KZTSKsoBo804jE7h75TkqG1JQSEhm0pjCdeKz+n1W/dxWyvu",
  render_errors: [view: TasktrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tasktracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
