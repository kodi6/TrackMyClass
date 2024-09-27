defmodule TrackMyClassWeb.Api.SchoolController do
  use TrackMyClassWeb, :controller

  alias TrackMyClass.Schools

  def index(conn, _params) do
    schools = Schools.list_schools()
    render(conn, :index, schools: schools)
  end
end
