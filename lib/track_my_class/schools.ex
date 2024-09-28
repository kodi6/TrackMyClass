defmodule TrackMyClass.Schools do
  import Ecto.Query, warn: false
  alias ElixirLS.LanguageServer.Providers.Completion.Reducers.Struct
  alias TrackMyClass.Repo

  alias TrackMyClass.Schools.{
    School
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
end
