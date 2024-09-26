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
    field :school_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:first_name, :last_name, :enrollment_number, :dob, :gender])
    |> validate_required([:first_name, :last_name, :enrollment_number, :dob, :gender])
    |> unique_constraint(:enrollment_number)
  end
end
