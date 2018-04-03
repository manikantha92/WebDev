import React from 'react';
import TaskForm from './task-form';
import AllTasks from './alltasks';

export default function Main(props) {
  render() {
    if (props.loggedin_user == null) {
      return (
        <div>
          hello
        </div>
      );
    } else {
      return (
        <div>
          <NewTask users={props.users} />
          <AllTasks tasks={props.tasks} editable=false/>
        </div>
      );
    }
  }
}
