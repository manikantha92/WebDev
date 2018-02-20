# Tasktracker

* The application is a simple task tracker, to create tasks and assign it to individual.
* A user has to register using his email here: http://tt.manikantha.in
* Once a user has logged in he can view all the tasks.
* A non-logged in user can only view tasks, he cannot create or edit them.
* Once a user is logged in unless and until he clicks on logout his session will not end.
* A user once logged can edit, delete or create a new task.
* The task page will show the existing tasks.
* If he creates a new task he can assign it to any of the users available, the title and description of the task are mandatory fields.
* By default the task is assigned to the user who is logged in.
* If he wants to add a new user at the same time he can do that by clicking on the new user button.
* Once a new user is added he can return to the tasks page by clicking on the All tasks button.
* The time spent on the task can be updated via 15 mins interval.
* The task can be marked as completed if it is completed.
* A completed task can be marked as incomplete if a user feels it is not completed.
* If a user is deleted the tasks related to him are not deleted, it will show as deleted user.



To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
