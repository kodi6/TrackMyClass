defmodule TrackMyClass.Schools do
  import Ecto.Query, warn: false
  alias TrackMyClass.Repo

  alias TrackMyClass.Schools.{
    School,
    Student
  }

  def list_schools do
    Repo.all(School)
  end

  def get_school!(id), do: Repo.get!(School, id)

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
    |> Repo.one!()
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

end
