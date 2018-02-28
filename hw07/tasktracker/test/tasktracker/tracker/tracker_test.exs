defmodule Tasktracker.TrackerTest do
  use Tasktracker.DataCase

  alias Tasktracker.Tracker

  describe "tasks" do
    alias Tasktracker.Tracker.Task

    @valid_attrs %{complete: true, description: "some description", title: "some title", worktime: "120.5"}
    @update_attrs %{complete: false, description: "some updated description", title: "some updated title", worktime: "456.7"}
    @invalid_attrs %{complete: nil, description: nil, title: nil, worktime: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tracker.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tracker.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tracker.create_task(@valid_attrs)
      assert task.complete == true
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.worktime == Decimal.new("120.5")
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tracker.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.complete == false
      assert task.description == "some updated description"
      assert task.title == "some updated title"
      assert task.worktime == Decimal.new("456.7")
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_task(task, @invalid_attrs)
      assert task == Tracker.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tracker.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tracker.change_task(task)
    end
  end

  describe "tasks" do
    alias Tasktracker.Tracker.Task

    @valid_attrs %{assigned_to: "some assigned_to", complete: true, description: "some description", title: "some title", worktime: "120.5"}
    @update_attrs %{assigned_to: "some updated assigned_to", complete: false, description: "some updated description", title: "some updated title", worktime: "456.7"}
    @invalid_attrs %{assigned_to: nil, complete: nil, description: nil, title: nil, worktime: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tracker.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tracker.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tracker.create_task(@valid_attrs)
      assert task.assigned_to == "some assigned_to"
      assert task.complete == true
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.worktime == Decimal.new("120.5")
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tracker.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.assigned_to == "some updated assigned_to"
      assert task.complete == false
      assert task.description == "some updated description"
      assert task.title == "some updated title"
      assert task.worktime == Decimal.new("456.7")
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_task(task, @invalid_attrs)
      assert task == Tracker.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tracker.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tracker.change_task(task)
    end
  end

  describe "timeblocks" do
    alias Tasktracker.Tracker.Timeblocks

    @valid_attrs %{end_time: "2010-04-17 14:00:00.000000Z", start_time: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{end_time: "2011-05-18 15:01:01.000000Z", start_time: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def timeblocks_fixture(attrs \\ %{}) do
      {:ok, timeblocks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_timeblocks()

      timeblocks
    end

    test "list_timeblocks/0 returns all timeblocks" do
      timeblocks = timeblocks_fixture()
      assert Tracker.list_timeblocks() == [timeblocks]
    end

    test "get_timeblocks!/1 returns the timeblocks with given id" do
      timeblocks = timeblocks_fixture()
      assert Tracker.get_timeblocks!(timeblocks.id) == timeblocks
    end

    test "create_timeblocks/1 with valid data creates a timeblocks" do
      assert {:ok, %Timeblocks{} = timeblocks} = Tracker.create_timeblocks(@valid_attrs)
      assert timeblocks.end_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert timeblocks.start_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_timeblocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_timeblocks(@invalid_attrs)
    end

    test "update_timeblocks/2 with valid data updates the timeblocks" do
      timeblocks = timeblocks_fixture()
      assert {:ok, timeblocks} = Tracker.update_timeblocks(timeblocks, @update_attrs)
      assert %Timeblocks{} = timeblocks
      assert timeblocks.end_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert timeblocks.start_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_timeblocks/2 with invalid data returns error changeset" do
      timeblocks = timeblocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_timeblocks(timeblocks, @invalid_attrs)
      assert timeblocks == Tracker.get_timeblocks!(timeblocks.id)
    end

    test "delete_timeblocks/1 deletes the timeblocks" do
      timeblocks = timeblocks_fixture()
      assert {:ok, %Timeblocks{}} = Tracker.delete_timeblocks(timeblocks)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_timeblocks!(timeblocks.id) end
    end

    test "change_timeblocks/1 returns a timeblocks changeset" do
      timeblocks = timeblocks_fixture()
      assert %Ecto.Changeset{} = Tracker.change_timeblocks(timeblocks)
    end
  end
end
