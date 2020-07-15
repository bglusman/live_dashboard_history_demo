defmodule LiveDashboardHistoryDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveDashboardHistoryDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveDashboardHistoryDemo.PubSub},
      # Start the Endpoint (http/https)
      LiveDashboardHistoryDemoWeb.Endpoint
      # Start a worker by calling: LiveDashboardHistoryDemo.Worker.start_link(arg)
      # {LiveDashboardHistoryDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveDashboardHistoryDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveDashboardHistoryDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
