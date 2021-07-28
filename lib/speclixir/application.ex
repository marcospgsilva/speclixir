defmodule Speclixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SpeclixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Speclixir.PubSub},
      # Start the Endpoint (http/https)
      SpeclixirWeb.Endpoint,
      # Start a worker by calling: Speclixir.Worker.start_link(arg)
      # {Speclixir.Worker, arg}
      Speclixir.Server
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Speclixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SpeclixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
