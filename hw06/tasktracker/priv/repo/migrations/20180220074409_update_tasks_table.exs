defmodule Tasktracker.Repo.Migrations.UpdateTasksTable do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      modify :assigned_to, :string, null: true
      modify :user_id, :bigInt, null: true
    end

end
end
