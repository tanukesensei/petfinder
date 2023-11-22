defmodule Petfinder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PetfinderWeb.Telemetry,
      # Start the Ecto repository
      Petfinder.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Petfinder.PubSub},
      # Start Finch
      {Finch, name: Petfinder.Finch},
      # Start the Endpoint (http/https)
      PetfinderWeb.Endpoint
      # Start a worker by calling: Petfinder.Worker.start_link(arg)
      # {Petfinder.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Petfinder.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetfinderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
