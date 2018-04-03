import React from 'react';
import Task from './task';

export default function Feed(params) {
  var tasks;

  if (params.editable) {
    tasks = _.map(params.tasks, (tracker) => <Task key={tracker.id} task={tracker} editable=true />);

  } else {
    tasks = _.map(params.tasks, (tracker) => <Task key={tracker.id} task={tracker} editable=false />);
  }

  return <div>
    {tasks}
  </div>;
}
