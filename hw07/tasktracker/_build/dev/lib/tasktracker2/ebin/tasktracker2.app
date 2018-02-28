{application,tasktracker2,
             [{applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             gettext,phoenix_pubsub,cowboy,phoenix_html,
                             phoenix,phoenix_live_reload,postgrex,
                             phoenix_ecto]},
              {description,"tasktracker2"},
              {modules,['Elixir.Tasktracker','Elixir.Tasktracker.Accounts',
                        'Elixir.Tasktracker.Accounts.User',
                        'Elixir.Tasktracker.Application',
                        'Elixir.Tasktracker.Repo',
                        'Elixir.Tasktracker.Tracker',
                        'Elixir.Tasktracker.Tracker.Task',
                        'Elixir.Tasktracker.Tracker.Timeblocks',
                        'Elixir.TasktrackerWeb',
                        'Elixir.TasktrackerWeb.ChangesetView',
                        'Elixir.TasktrackerWeb.Endpoint',
                        'Elixir.TasktrackerWeb.ErrorHelpers',
                        'Elixir.TasktrackerWeb.ErrorView',
                        'Elixir.TasktrackerWeb.FallbackController',
                        'Elixir.TasktrackerWeb.Gettext',
                        'Elixir.TasktrackerWeb.LayoutView',
                        'Elixir.TasktrackerWeb.PageController',
                        'Elixir.TasktrackerWeb.PageView',
                        'Elixir.TasktrackerWeb.Router',
                        'Elixir.TasktrackerWeb.Router.Helpers',
                        'Elixir.TasktrackerWeb.SessionController',
                        'Elixir.TasktrackerWeb.TaskController',
                        'Elixir.TasktrackerWeb.TaskView',
                        'Elixir.TasktrackerWeb.TimeblocksController',
                        'Elixir.TasktrackerWeb.TimeblocksView',
                        'Elixir.TasktrackerWeb.UserController',
                        'Elixir.TasktrackerWeb.UserSocket',
                        'Elixir.TasktrackerWeb.UserView']},
              {registered,[]},
              {vsn,"0.0.1"},
              {mod,{'Elixir.Tasktracker.Application',[]}},
              {extra_applications,[logger,runtime_tools]}]}.