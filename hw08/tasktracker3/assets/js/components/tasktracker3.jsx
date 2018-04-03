import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, connect } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Nav from './nav';
import Main from './main';
import AllTasks from './alltasks';
import Users from './users';
import TaskForm from './task-form';
import UpdateTask from '.updateTask'

export default function tasktracker3init(store) {
  let root = document.getElementById('root');
  ReactDOM.render(<Provider store={store}><TaskTracker3 /></Provider>, root);
}

let TaskTracker3 = connect((state) => state)((props) => {
  return (
    <Router>
      <div>
        <Nav current_user={props.current_user}/>
        <Route path="/" exact={true} render={() =>
          <Home current_user={props.current_user} users={props.users} tasks={props.tasks} />
        } />
        <Route path="/users" exact={true} render={() =>
          <Users users={props.users} />
        } />
        <Route path="/users/:user_id" render={({match}) =>
          <Feed tasks={_.filter(props.tasks, (tt) => match.params.user_id == tt.user.id)}
            editable={true} />
        } />
        <Route path="/tasks/:task_id" render={({match}) =>
          <TaskEdit task={_.find(props.tasks, (tt) =>
            match.params.task_id == tt.task.id)
           } />
           } />
        </div>
      </Router>
    );
  }
}

//Attribution: https://github.com/NatTuck/microblog-spa/blob/lec20-end/assets/js/cs/microblog.jsx
