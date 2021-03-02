defmodule ShoreChallenge.Application do
  use Application

  def start(_type, _args) do
    children = [
      ShoreChallenge.Db,
      ShoreChallengeWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ShoreChallenge.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ShoreChallengeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
