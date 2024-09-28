defmodule TrackMyClassWeb.Api.StudentJSON do
  alias TrackMyClass.Schools.Student


  def index(%{students: students}) do
    %{date: for(student <- students, do: data(student))}
  end

  defp data(%Student{} = student) do
    %{
        id: student.id,
        first_name: student.first_name,
        last_name: student.last_name,
        enrollment_number: student.enrollment_number,
        dob: student.dob,
        gender: student.gender,
        school_id: student.school_id
    }
  end

  def show(%{student: student}) do
    %{data: data(student)}
  end
end
