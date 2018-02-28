# Tasktracker2

* The application is a simple task tracker, to create tasks and assign it to individual.
* A user has to register using his email here: http://tasks2.manikantha.in
* At the time of registration he can select a manager from the available users, the user can also register without a manager.
* Once a user has logged in he can view all the tasks in the tasks page:
  - The list of tasks have a track button which helps in tracking time spent on that task.
  - When start button in the "Track" column is clicked it turns into a stop button and when the stop button is clicked it stops the time.
  - When you click on the show button the task details along with the total number of time blocks is also shown to the user.
  - In that page he can manually add time block by clicking on the button "Add Time Block" which takes you to the add time block page and you can select the
    start and end time.
    - If the task is deleted all the associated time blocks are also deleted.
  - A user has to log in to view the "Show", "Edit" and "Delete" buttons
  - Above the tasks there is a navigation pane which has links to create "New Task", Profile: "To view your own profile" ,List Users: "To list all the users"
 * Profile page:
  - In the profile page the user will see the name of his manager and list of all his underlings.
  - Also, additionally he will view a task report of all the underlings task status.
  - He can update and delete the task.
  - In the navigation pane he can again go back to "All tasks" page, create "New Task", "List Users" and "Edit Account" to edit the user details.


* A non-logged in user can only view tasks, he cannot create, edit or delete them.
* Once a user is logged in unless and until he clicks on logout his session will not end.

* A user once logged can edit, delete or create a new task.
* If he creates a new task he can assign it to any of the users who are his underlings, the title and description of  the task are mandatory fields.
* If he wants to add a new user at the same time he can do that by clicking on the new user button.
* Once a new user is added he can return to the tasks page by clicking on the All tasks button.
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
