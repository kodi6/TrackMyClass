defmodule TrackMyClassWeb.Api.AttendanceJSON do
  alias TrackMyClass.Schools.Attendance

  def show(%{attendance: attendance}) do
    %{data: data(attendance)}
  end

  defp data(%Attendance{} = attendance) do
    %{
      id: attendance.id,
      student_id: attendance.student_id,
      date: attendance.date,
      forenoon_present: attendance.forenoon_present,
      afternoon_present: attendance.afternoon_present
    }
  end
end
