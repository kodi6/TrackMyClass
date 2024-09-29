defmodule TrackMyClassWeb.Api.StudentController do
  use TrackMyClassWeb, :controller

  alias TrackMyClass.Schools.Student
  alias TrackMyClass.Schools

  action_fallback TrackMyClassWeb.FallbackController

  def index(conn, %{"school_id" => school_id}) do
    students = Schools.list_students(school_id)

    case students do
      [] ->
        {:error, :not_found}

      students ->
        render(conn, :index, students: students)
    end
  end

  def create(conn, %{"student" => student_params}) do
    with {:ok, %Student{} = student} <- Schools.create_student(student_params) do
      conn
      |> put_status(:created)
      |> render(:show, student: student)
    end
  end

  def show(conn, %{"school_id" => school_id, "student_id" => student_id}) do
    case Schools.get_school_student(school_id, student_id) do
      %Student{} = student ->
        render(conn, :show, student: student)

      _ ->
        {:error, :not_found}
    end
  end

  def update(conn, %{
        "school_id" => school_id,
        "student_id" => student_id,
        "student" => student_params
      }) do
    with {:ok, %Student{} = student} <-
           Schools.update_school_student(school_id, student_id, student_params) do
      render(conn, :show, student: student)
    end
  end

  def delete(conn, %{"school_id" => school_id, "student_id" => student_id}) do
    with {:ok, %Student{}} <- Schools.delete_school_student(school_id, student_id) do
      send_resp(conn, :no_content, "")
    end
  end
end
