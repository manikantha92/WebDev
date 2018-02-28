defmodule Tasktracker.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :flag, :boolean
      add :task_id, references(:tasks, on_delete: :delete_all)

      timestamps()
    end

    create index(:timeblocks, [:task_id])
  end
end
