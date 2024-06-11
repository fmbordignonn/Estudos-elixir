defmodule BankApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BankAppWeb.Telemetry,
      BankApp.Repo,
      {DNSCluster, query: Application.get_env(:bank_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BankApp.PubSub},
      # Start a worker by calling: BankApp.Worker.start_link(arg)
      # {BankApp.Worker, arg},
      # Start to serve requests, typically the last entry
      BankAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BankApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BankAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
