defmodule TrackMyClass.Repo.Migrations.CreateAttendances do
  use Ecto.Migration

  def change do
    create table(:attendances, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date, :date
      add :forenoon_present, :boolean, default: true, null: false
      add :afternoon_present, :boolean, default: true, null: false
      add :student_id, references(:students, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:attendances, [:student_id])
  end
end
