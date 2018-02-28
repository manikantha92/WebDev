defmodule Tasktracker.Repo.Migrations.UpdateAssignedTo do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      remove :assigned_to
      remove :time

    end
  end
end
