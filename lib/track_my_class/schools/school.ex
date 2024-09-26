defmodule TrackMyClass.Schools.School do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "schools" do
    field :name, :string
    field :address, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
