import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Redirect } from 'react-router-dom';
import { Provider, connect } from 'react-redux';
import AddUser from './adduser';
import LoginForm from './login';
import Nav from './nav';
import Tasks from './tasks';
import NewTask from './newtask';
import UpdateTask from './updatetask';
import Users from './users';

export default function tasktracker_init(store) {
  ReactDOM.render(
    <Provider store={store}>
      <Tasktracker />
    </Provider>,
    document.getElementById('root'),
  );
}

let Tasktracker = connect((state) => state)((props) => {
  let valid_user = props.token;
    return (
      <Router>
        <div>
          <Nav />
          <Route path="/" exact={true} render={() =>
            valid_user? <Tasks tasks={props.tasks}/> : <p>Welcome to TaskTracker V3! Please login to view tasks or change them</p>
          } />
          <Route path="/adduser" exact={true} render={() =>
            <AddUser />
          } />
          <Route path="/login" exact={true} render={() =>
            valid_user? (<Redirect to="/" />) : (<LoginForm />)
          } />
          <Route path="/tasks/new" exact={true} render={() =>
            valid_user? (<NewTask />) : (<Redirect to="/" />)
          } />
          <Route path="/tasks/edit" exact={true} render={() =>
            <UpdateTask />
          } />
          <Route path="/users" exact={true} render={() =>
            valid_user? (<Users />) : (<Redirect to="/" />)
          } />

        </div>
      </Router>
    );
  });
