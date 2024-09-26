defmodule TrackMyClass.Repo do
  use Ecto.Repo,
    otp_app: :track_my_class,
    adapter: Ecto.Adapters.Postgres
end
