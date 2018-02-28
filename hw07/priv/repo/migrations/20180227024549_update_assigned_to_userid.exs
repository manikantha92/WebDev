defmodule Tasktracker.Repo.Migrations.UpdateAssignedToUserid do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :assigned_to, references(:users, on_delete: :nothing)


    end
  end
end
