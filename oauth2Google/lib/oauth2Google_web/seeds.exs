# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker3.Repo.insert!(%TaskTracker3.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds do
  alias TaskTracker3.Repo
  alias TaskTracker3.Users.User
  alias TaskTracker3.Tasks.Task

  def run do
    ph1 = Comeonin.Argon2.hashpwsalt("password1");
    Repo.delete_all(User)
    a = Repo.insert!(%User{ name: "alice", email: "alice@example.com", password_hash: ph1 })
    b = Repo.insert!(%User{ name: "bob", email: "bob@example.com", password_hash: ph1 })
    c = Repo.insert!(%User{ name: "carol", email: "carol@example.com", password_hash: ph1 })
    d = Repo.insert!(%User{ name: "dave", email: "dave@example.com", password_hash: ph1 })

  
  end
end

Seeds.run
