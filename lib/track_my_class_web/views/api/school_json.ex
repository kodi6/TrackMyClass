defmodule TrackMyClassWeb.Api.SchoolJSON do
  alias TrackMyClass.Schools.School

  def index(%{schools: schools}) do
    %{date: for(school <- schools, do: data(school))}
  end

  defp data(%School{} = school) do
    %{
      id: school.id,
      name: school.name,
      address: school.address
    }
  end
end
