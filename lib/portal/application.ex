defmodule Portal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Portal.Worker.start_link(arg)
      Supervisor.child_spec({Portal.Door, :blue}, id: :door_blue),
      Supervisor.child_spec({Portal.Door, :green}, id: :door_green),
      Supervisor.child_spec({Portal.Bucket, :apples}, id: :bucket_apples)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Portal.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
