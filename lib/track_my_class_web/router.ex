defmodule TrackMyClassWeb.Router do
  alias TrackMyClassWeb.Api.SchoolController
  use TrackMyClassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrackMyClassWeb.Api do
    pipe_through :api

    get "/schools", SchoolController, :index
    get "/schools/:id", SchoolController, :show
  end
end
