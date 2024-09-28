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

  def update(conn, %{"id" => id, "school" => school_params}) do
    school = Schools.get_school!(id)
    with {:ok, %School{} = school} <- Schools.update_school(school, school_params) do
      render(conn, :show, school: school)
    end
  end
end
