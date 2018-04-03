import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Nav from './nav';
import AllTasks from './alltasks';
import Users from './users';
import TaskForm from './task-form';

export default function tasktracker3init() {
  let root = document.getElementById('root');
  ReactDOM.render(<TaskTracker3 />, root);
}

class TaskTracker3 extends React.Component {
  constructor(props) {
    super(props);

    //setting up empty values in state
    this.state = {
      tasks: [],
      users: [],
      loggedin_user: null
    };

    this.request_tasks();
    this.request_users();
  }

  request_users() {
    $.ajax("/api/v1/users", {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: (resp) => {
        this.setState(_.extend(this.state, { users: resp.data }));
      },
    });
  }

  request_tasks() {
    $.ajax("/api/v1/tasks", {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: (resp) => {
        this.setState(_.extend(this.state, { tasks: resp.data }));
      },
    });
  }


  render() {
    return (
      <Router>
        <div>
          <Nav loggedin_user={this.state.loggedin_user}/>
          <Route path="/" exact={true} render={() =>
            <Main loggedin_user={this.state.loggedin_user} users={this.state.users} tasks={this.state.tasks} />
          } />
          <Route path="/users" exact={true} render={() =>
            <Users users={this.state.users} />
          } />
          <Route path="/users/:user_id" render={({match}) =>
            <AllTasks tasks={_.filter(this.state.tasks, (tt) =>
              match.params.user_id == tt.user.id ) editable=true
            } />
          } />
          <Route path="/tasks/:task_id" render={({match}) =>
            <UpdateTask task={_.find(this.state.tasks, (tt) =>
              match.params.task_id == tt.task.id)
             } />
           } />
        </div>
      </Router>
    );
  }
}

//Attribution: https://github.com/NatTuck/microblog-spa/blob/lec20-end/assets/js/cs/microblog.jsx
