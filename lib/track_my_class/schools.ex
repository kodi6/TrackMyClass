defmodule TrackMyClass.Schools do
  import Ecto.Query, warn: false
  alias TrackMyClass.Repo

  alias TrackMyClass.Schools.{
    School
  }

  def list_schools do
    Repo.all(School)
  end

  def get_school!(id), do: Repo.get!(School, id)

end
