defmodule TrackMyClass.Schools.Attendance do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "attendances" do
    field :date, :date
    field :forenoon_present, :boolean, default: true
    field :afternoon_present, :boolean, default: true
    field :student_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(attendance, attrs) do
    attendance
    |> cast(attrs, [:date, :forenoon_present, :afternoon_present])
    |> validate_required([:date, :forenoon_present, :afternoon_present])
  end
end
