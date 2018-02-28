defmodule Tasktracker.Tracker.Timeblocks do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tracker.Timeblocks


  schema "timeblocks" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    field :flag, :boolean, default: false
    belongs_to :task, Tasktracker.Tracker.Task

    timestamps()
  end

  @doc false
  def changeset(%Timeblocks{} = timeblocks, attrs) do
    timeblocks
    |> cast(attrs, [:start_time, :end_time, :task_id, :flag])
    |> validate_required([:start_time, :task_id, :end_time, :flag])
    |> check_constraint(:end_time, [message: "End time must always be greater than start time please re enter the end time", name: "end_time_must_be_greater" ])

  end
end
