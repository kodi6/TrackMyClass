defmodule TrackMyClass.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TrackMyClassWeb.Telemetry,
      TrackMyClass.Repo,
      {DNSCluster, query: Application.get_env(:track_my_class, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TrackMyClass.PubSub},
      # Start a worker by calling: TrackMyClass.Worker.start_link(arg)
      # {TrackMyClass.Worker, arg},
      # Start to serve requests, typically the last entry
      TrackMyClassWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TrackMyClass.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TrackMyClassWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
