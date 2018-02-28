defmodule TasktrackerWeb.TimeblocksView do
  use TasktrackerWeb, :view
  alias TasktrackerWeb.TimeblocksView

  def render("index.json", %{timeblocks: timeblocks}) do
    %{data: render_many(timeblocks, TimeblocksView, "timeblocks.json")}
  end

  def render("show.json", %{timeblocks: timeblocks}) do
    %{data: render_one(timeblocks, TimeblocksView, "timeblocks.json")}
  end

  def render("timeblocks.json", %{timeblocks: timeblocks}) do
    %{id: timeblocks.id,
      task_id: timeblocks.task_id,
      start_time: timeblocks.start_time,
      end_time: timeblocks.end_time,
      flag: timeblocks.flag}
  end
end
