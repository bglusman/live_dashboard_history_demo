# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :live_dashboard_history_demo, LiveDashboardHistoryDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eNxN5mE/IUY5r85u7ki6S/fxMdJJRkshl/Yy92gLMdiO1Kdur1jxhkPkq4ulj9JW",
  render_errors: [view: LiveDashboardHistoryDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveDashboardHistoryDemo.PubSub,
  live_view: [signing_salt: "iRDXiKdl"]


config :live_dashboard_history, LiveDashboardHistory,
  router: LiveDashboardHistoryDemoWeb.Router,
  metrics: LiveDashboardHistoryDemoWeb.Telemetry
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
