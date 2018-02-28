defmodule TasktrackerWeb.TimeblocksController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Tracker
  alias Tasktracker.Tracker.Timeblocks

  action_fallback TasktrackerWeb.FallbackController

  def index(conn, _params) do
    timeblocks = Tracker.list_timeblocks()
    render(conn, "index.json", timeblocks: timeblocks)
  end

  def new(conn, _params) do
    changeset = Tracker.change_timeblocks(%Timeblocks{})
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    timeblocks = Tracker.get_timeblocks!(id)
    changeset = Tracker.change_timeblocks(timeblocks)
    render(conn, "edit.html", timeblocks: timeblocks, changeset: changeset)
  end
  

  def create_timeblock(conn, %{"timeblocks" => timeblocks_params}) do
      case Tracker.create_timeblocks(timeblocks_params) do
        {:ok, timeblocks} ->
          conn
          |> put_flash(:info, "Timeblock created successfully.")
          |> redirect(to: task_path(conn, :show, Tasktracker.Tracker.get_task(timeblocks_params["task_id"])))
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
  end

  def update_timeblock(conn, %{"id" => id, "timeblocks" => timeblocks_params}) do
      timeblocks = Tracker.get_timeblocks!(id)
      case Tracker.update_timeblocks(timeblocks, timeblocks_params) do
        {:ok, timeblocks} ->
          conn
          |> put_flash(:info, "TimeBlock updated successfully.")
          |> redirect(to: task_path(conn, :show, Tasktracker.Tracker.get_task(timeblocks.task_id)))
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", timeblocks: timeblocks, changeset: changeset)
  end
end

  def create(conn, %{"timeblocks" => timeblocks_params}) do
    timeblocks_param = Enum.drop(timeblocks_params,-2)
    with {:ok, %Timeblocks{} = timeblocks} <- Tracker.create_timeblocks(timeblocks_params) do
      render(conn, "show.json", timeblocks: timeblocks)
    end
  end

  def show(conn, %{"id" => id}) do
    timeblocks = Tracker.get_timeblocks!(id)
    render(conn, "show.json", timeblocks: timeblocks)
  end

  def update(conn, %{"id" => id, "timeblocks" => timeblocks_params}) do
    timeblocks = Tracker.get_timeblocks!(id)
    with {:ok, %Timeblocks{} = timeblocks} <- Tracker.update_timeblocks(timeblocks, timeblocks_params) do
      render(conn, "show.json", timeblocks: timeblocks)
    end
  end

  def delete(conn, %{"id" => id}) do
    timeblocks = Tracker.get_timeblocks!(id)

    {:ok, _timeblocks} = Tracker.delete_timeblocks(timeblocks)
    conn
    |> put_flash(:info, "TimeBlock deleted successfully.")
    |> redirect(to: task_path(conn, :show, timeblocks.task_id))
  end



  end
