defmodule ShoreChallenge.Db do
  use Ecto.Repo,
    otp_app: :shore_challenge,
    adapter: Ecto.Adapters.Postgres
end
