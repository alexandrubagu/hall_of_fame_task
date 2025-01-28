defmodule HallOfFame.Repo do
  use Ecto.Repo,
    otp_app: :hall_of_fame,
    adapter: Ecto.Adapters.Postgres
end
