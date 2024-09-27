defmodule TrackMyClass.Schools.Holiday do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "holidays" do
    field :name, :string
    field :date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(holiday, attrs) do
    holiday
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
