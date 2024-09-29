defmodule TrackMyClassWeb.Api.AttendanceController do
  use TrackMyClassWeb, :controller

  alias TrackMyClass.Schools
  alias TrackMyClass.Schools.Attendance


  def create(conn, %{"school_id" => school_id, "student_id" => student_id, "attendance" => attendance_params}) do
    case Schools.get_student_in_school(school_id, student_id) do
      nil ->
        {:error, :not_found}

      student ->
        attendance_params = Map.put(attendance_params, "student_id", student.id)
        with {:ok, %Attendance{} = attendance} <-  Schools.create_attendance(attendance_params) do
          conn
          |> put_status(:created)
          |> render(:show, attendance: attendance)
        end
    end
  end

  def show(conn, %{"school_id" => school_id, "student_id" => student_id, "date" => date}) do
    {:ok, date} = Date.from_iso8601(date)
    case Schools.get_student_in_school(school_id, student_id) do
      nil ->
        {:error, :not_found}

      student ->
        attendance = Schools.get_attendance_by_date(student.id, date)
        render(conn, :show, attendance: attendance)
    end
  end

  def update(conn, %{"attendance_id" => attendance_id, "attendance" => attendance_params}) do
    attendance = Schools.get_attendance!(attendance_id)
    with {:ok, %Attendance{} = attendance} <- Schools.update_attendance(attendance, attendance_params) do
      render(conn, :show, attendance: attendance)
    end
  end

  def delete(conn, %{"attendance_id" => attendance_id}) do
    attendance = Schools.get_attendance!(attendance_id)
    with {:ok, %Attendance{}} <- Schools.delete_attendance(attendance) do
      send_resp(conn, :no_content, "")
    end
  end

end
