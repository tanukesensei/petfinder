defmodule Petfinder.Repo do
  use Ecto.Repo,
    otp_app: :petfinder,
    adapter: Ecto.Adapters.Postgres
end
