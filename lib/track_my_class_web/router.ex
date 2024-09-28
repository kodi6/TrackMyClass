defmodule TrackMyClassWeb.Router do
  use TrackMyClassWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrackMyClassWeb.Api do
    pipe_through :api

    get "/schools", SchoolController, :index
    post "/schools", SchoolController, :create
    get "/schools/:school_id", SchoolController, :show
    put "/schools/:school_id", SchoolController, :update
    delete "/schools/:school_id", SchoolController, :delete


    get "/schools/:school_id/students", StudentController, :index
    post "/schools/:school_id/students", StudentController, :create
    get "/schools/:school_id/students/:student_id", StudentController, :show
    put "/schools/:school_id/students/:student_id", StudentController, :update
    delete "/schools/:school_id/students/:student_id", StudentController, :delete
  end
end
