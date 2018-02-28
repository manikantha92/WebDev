defmodule TasktrackerWeb.SessionController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Accounts

  def create(conn, %{"email" => email }) do
    user = Accounts.get_user_by_email(email)
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back #{user.name}")
      |>redirect(to:  task_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Can't create session")
      |> redirect(to: page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end

  def task_id_session(conn,%{ "task_id" => task_id }) do
    conn
    |> put_session(:task_id, task_id)
    |> redirect(to: timeblocks_path(conn, :new))
  end

end
