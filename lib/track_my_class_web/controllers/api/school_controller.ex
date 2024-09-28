defmodule TrackMyClassWeb.Api.SchoolController do
  use TrackMyClassWeb, :controller

  alias TrackMyClass.Schools.School
  alias TrackMyClass.Schools

  def index(conn, _params) do
    schools = Schools.list_schools()
    render(conn, :index, schools: schools)
  end

  def show(conn, %{"id" => id}) do
    school = Schools.get_school!(id)
    render(conn, :show, school: school)
  end

  def create(conn, %{"school" => school_params}) do
    with {:ok, %School{} = school} <- Schools.create_school(school_params) do
      conn
      |> put_status(:created)
      |> render(:show, school: school)
    end
  end
end
