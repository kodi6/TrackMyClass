defmodule TrackMyClassWeb.Router do
  use TrackMyClassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrackMyClassWeb.Api do
    pipe_through :api

    get "/schools", SchoolController, :index
    get "/schools/:id", SchoolController, :show
    post "/schools", SchoolController, :create
    put "/schools/:id", SchoolController, :update
  end
end
