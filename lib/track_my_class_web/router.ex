defmodule TrackMyClassWeb.Router do
  use TrackMyClassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrackMyClassWeb do
    pipe_through :api
  end
end
