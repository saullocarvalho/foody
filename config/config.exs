# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :foody,
  ecto_repos: [Foody.Repo]

# Configures the endpoint
config :foody, Foody.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uaFWrZgOqki7ddO7/Md/AsmwzUrs/thQ9LdyCAdHJuomXip0uEIXcq2SmaNk9wLp",
  render_errors: [view: Foody.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Foody.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
