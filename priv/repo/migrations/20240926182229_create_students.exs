defmodule TrackMyClass.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :enrollment_number, :string
      add :dob, :date
      add :gender, :string
      add :school_id, references(:schools, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:students, [:enrollment_number])
    create index(:students, [:school_id])
  end
end
