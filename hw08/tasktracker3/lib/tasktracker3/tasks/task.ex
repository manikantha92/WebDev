defmodule Tasktracker3.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer, default: 0
    field :title, :string
    belongs_to :user, TaskTracker3.Users.User, foreign_key: :user_id
    belongs_to :assigned_to_user, Tasktracker3.Users.User, foreign_key: :assigned_to


    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time, :completed, :user_id, :assigned_to])
    |> validate_required([:title, :description, :time, :completed, :user_id, :assigned_to])
  end
end
