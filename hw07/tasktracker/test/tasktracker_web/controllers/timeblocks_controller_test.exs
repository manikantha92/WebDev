defmodule TasktrackerWeb.TimeblocksControllerTest do
  use TasktrackerWeb.ConnCase

  alias Tasktracker.Tracker
  alias Tasktracker.Tracker.Timeblocks

  @create_attrs %{end_time: "2010-04-17 14:00:00.000000Z", start_time: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{end_time: "2011-05-18 15:01:01.000000Z", start_time: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{end_time: nil, start_time: nil}

  def fixture(:timeblocks) do
    {:ok, timeblocks} = Tracker.create_timeblocks(@create_attrs)
    timeblocks
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all timeblocks", %{conn: conn} do
      conn = get conn, timeblocks_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create timeblocks" do
    test "renders timeblocks when data is valid", %{conn: conn} do
      conn = post conn, timeblocks_path(conn, :create), timeblocks: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, timeblocks_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "end_time" => "2010-04-17 14:00:00.000000Z",
        "start_time" => "2010-04-17 14:00:00.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, timeblocks_path(conn, :create), timeblocks: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update timeblocks" do
    setup [:create_timeblocks]

    test "renders timeblocks when data is valid", %{conn: conn, timeblocks: %Timeblocks{id: id} = timeblocks} do
      conn = put conn, timeblocks_path(conn, :update, timeblocks), timeblocks: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, timeblocks_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "end_time" => "2011-05-18 15:01:01.000000Z",
        "start_time" => "2011-05-18 15:01:01.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn, timeblocks: timeblocks} do
      conn = put conn, timeblocks_path(conn, :update, timeblocks), timeblocks: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete timeblocks" do
    setup [:create_timeblocks]

    test "deletes chosen timeblocks", %{conn: conn, timeblocks: timeblocks} do
      conn = delete conn, timeblocks_path(conn, :delete, timeblocks)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, timeblocks_path(conn, :show, timeblocks)
      end
    end
  end

  defp create_timeblocks(_) do
    timeblocks = fixture(:timeblocks)
    {:ok, timeblocks: timeblocks}
  end
end
