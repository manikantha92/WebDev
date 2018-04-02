defmodule TasktrackerWeb.Router do
  use TasktrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :get_current_user
    plug :get_current_task
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug :get_current_user
    plug :get_current_task
  end

  def get_current_user(conn, _params) do
    user_id = get_session(conn, :user_id)
    task_id = get_session(conn, :task_id)
    user = Tasktracker.Accounts.get_user(user_id || -1)
    conn
    |> assign(:current_user, user)
    |> assign(:current_task, task_id)
  end

  def get_current_task(conn, _params) do
    task_id = get_session(conn, :task_id)
    conn
    |> assign(:current_task, task_id)
  end


  scope "/", TasktrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/task", PageController, :task

    resources "/users", UserController
    resources "/tasks", TaskController

    post "/session", SessionController, :create
    post "/session_task", SessionController, :task_id_session
    delete "/session", SessionController, :delete


    get "/timeblocks/new", TimeblocksController, :new
    post "/timeblocks/create", TimeblocksController, :create_timeblock
    get "/timeblocks/:id/edit", TimeblocksController, :edit
    put "/timeblocks/:id", TimeblocksController, :update_timeblock
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", TasktrackerWeb do
    pipe_through :api
    resources "/timeblocks", TimeblocksController

  end
end



#Attribution: https://medium.com/everydayhero-engineering/create-an-elixir-phoenix-api-part-1-initial-barebones-setup-7c840a6c4c5c
