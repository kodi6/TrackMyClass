defmodule TrackMyClass.Repo.Migrations.CreateHolidays do
  use Ecto.Migration

  def change do
    create table(:holidays, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
