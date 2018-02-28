defmodule Tasktracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :assigned_to, :string
      add :complete, :boolean, default: false, null: false
      add :time, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:user_id])
  end


end
