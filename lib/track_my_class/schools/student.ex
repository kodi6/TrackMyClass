defmodule TrackMyClass.Schools.Student do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "students" do
    field :first_name, :string
    field :last_name, :string
    field :enrollment_number, :string
    field :dob, :date
    field :gender, :string
    belongs_to :school, TrackMyClass.Schools.School

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:first_name, :last_name, :enrollment_number, :dob, :gender, :school_id])
    |> validate_required([:first_name, :last_name, :enrollment_number, :dob, :gender, :school_id])
    |> unique_constraint(:enrollment_number)
  end
end
