defmodule UncaloteMe.Repo do
  use Ecto.Repo,
    otp_app: :uncalote_me,
    adapter: Ecto.Adapters.Postgres
end
