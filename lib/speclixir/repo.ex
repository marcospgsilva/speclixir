defmodule Speclixir.Repo do
  use Ecto.Repo,
    otp_app: :speclixir,
    adapter: Ecto.Adapters.Postgres
end
