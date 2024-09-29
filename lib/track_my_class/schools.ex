defmodule TrackMyClass.Schools do
  import Ecto.Query, warn: false
  alias TrackMyClass.Repo

  alias TrackMyClass.Schools.{
    School,
    Student,
    Attendance
  }

  def list_schools do
    Repo.all(School)
  end

  def get_school!(id), do: Repo.get(School, id)

  def create_school(attrs \\ %{}) do
    %School{}
    |> School.changeset(attrs)
    |> Repo.insert()
  end

  def update_school(%School{} = school, attrs) do
    school
    |> School.changeset(attrs)
    |> Repo.update()
  end

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  def delete_school(%School{} = school) do
    Repo.delete(school)
  end

  def list_students(school_id) do
    Student
    |> where([s], s.school_id == ^school_id)
    |> Repo.all()
  end

  def get_school_student(school_id, student_id) do
    Student
    |> where([s], s.school_id == ^school_id and s.id == ^student_id)
    |> Repo.one()
  end

  def update_school_student(school_id, student_id, attrs) do
    Student
    |> where([s], s.school_id == ^school_id and s.id == ^student_id)
    |> Repo.one()
    |> case do
      nil -> {:error, :not_found}
      student -> student |> Student.changeset(attrs) |> Repo.update()
    end
  end

  def delete_school_student(school_id, student_id) do
    Student
    |> where([s], s.school_id == ^school_id and s.id == ^student_id)
    |> Repo.one()
    |> case do
      nil -> {:error, :not_found}
      student -> Repo.delete(student)
    end
  end


  def get_student_in_school(school_id, student_id) do
    Repo.get_by(Student, id: student_id, school_id: school_id)
  end

  def create_attendance(attrs \\ %{}) do
    %Attendance{}
    |> Attendance.changeset(attrs)
    |> Repo.insert()
  end

  def get_attendance_by_date(student_id, date) do
    Repo.get_by(Attendance, student_id: student_id, date: date)
  end

  def get_attendance!(id), do: Repo.get!(Attendance, id)

  def update_attendance(%Attendance{} = attendance, attrs) do
    attendance
    |> Attendance.changeset(attrs)
    |> Repo.update()
  end

  def delete_attendance(%Attendance{} = attendance) do
    Repo.delete(attendance)
  end
end
