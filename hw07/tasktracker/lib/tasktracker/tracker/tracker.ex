defmodule Tasktracker.Tracker do
  @moduledoc """
  The Tracker context.
  """

  import Ecto.Query, warn: false
  alias Tasktracker.Repo

  alias Tasktracker.Tracker.Task
  alias Tasktracker.Tracker.Timeblocks

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
     |> Repo.preload(:user)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id) do
    Repo.get!(Task, id)
     |> Repo.preload(:user)
  end

  def get_task(id) do
    Repo.get(Task, id)
     |> Repo.preload(:user)
  end

  # All the tasks by a manager
  def get_task_by_manager_id(id) do
    man_id = Tasktracker.Accounts.get_id_by_manager_id(id);
    Repo.all(
      from t in Task,
      where: t.assigned_to in ^man_id
    )
  end

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end





  @doc """
  Returns the list of timeblocks.

  ## Examples

      iex> list_timeblocks()
      [%Timeblocks{}, ...]

  """
  def list_timeblocks do
    Repo.all(Timeblocks)
    |> Repo.preload(:task)
  end

  @doc """
  Gets a single timeblocks.

  Raises `Ecto.NoResultsError` if the Timeblocks does not exist.

  ## Examples

      iex> get_timeblocks!(123)
      %Timeblocks{}

      iex> get_timeblocks!(456)
      ** (Ecto.NoResultsError)

  """
  def get_timeblocks!(id), do: Repo.get!(Timeblocks, id)

  @doc """
  Creates a timeblocks.

  ## Examples

      iex> create_timeblocks(%{field: value})
      {:ok, %Timeblocks{}}

      iex> create_timeblocks(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_timeblocks(attrs \\ %{}) do
    %Timeblocks{}
    |> Timeblocks.changeset(attrs)
    |> Repo.insert()
  end

  def tb_maps_for do
    Repo.all(
      from p in Timeblocks,
      where: p.flag==^true
    )
    |> Enum.map(&({&1.task_id, &1.id}))
    |> Enum.into(%{})
  end

  def get_tb_by_task_id(id) do
    Repo.all(
      from t in Timeblocks,
      where: t.flag==^false and t.task_id==^id
    )
  end

  
  @doc """
  Updates a timeblocks.

  ## Examples

      iex> update_timeblocks(timeblocks, %{field: new_value})
      {:ok, %Timeblocks{}}

      iex> update_timeblocks(timeblocks, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_timeblocks(%Timeblocks{} = timeblocks, attrs) do
    timeblocks
    |> Timeblocks.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Timeblocks.

  ## Examples

      iex> delete_timeblocks(timeblocks)
      {:ok, %Timeblocks{}}

      iex> delete_timeblocks(timeblocks)
      {:error, %Ecto.Changeset{}}

  """
  def delete_timeblocks(%Timeblocks{} = timeblocks) do
    Repo.delete(timeblocks)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking timeblocks changes.

  ## Examples

      iex> change_timeblocks(timeblocks)
      %Ecto.Changeset{source: %Timeblocks{}}

  """
  def change_timeblocks(%Timeblocks{} = timeblocks) do
    Timeblocks.changeset(timeblocks, %{})
  end


end
