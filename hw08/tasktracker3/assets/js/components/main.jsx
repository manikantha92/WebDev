import React from 'react';
import TaskForm from './task-form';
import NewTask from './newTask';
import AllTasks from './alltasks';

export default function Main(props) {

    if (props.token == null) {
      return (
        <div>
          hello
        </div>
      );
    } else {
      return (
        <div>
          <NewTask users={props.users} />
          <AllTasks tasks={props.tasks} editable={false} />
        </div>
      );
    }

}
