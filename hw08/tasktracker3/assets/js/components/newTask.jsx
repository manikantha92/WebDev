import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';

export default function NewTask(params) {
  let users = _.map(params.users, (uu) => <option key={uu.id} value={uu.id}>{uu.name}</option>);
  return <div style={{padding: "4ex"}}>
    <h2>New Task</h2>
    <FormGroup>
      <Label for="user_id">User</Label>
      <Input type="select" name="user_id">
        {users}
      </Input>
    </FormGroup>
    <FormGroup>
      <Label for="title">Title</Label>
      <Input name="title" />
    </FormGroup>
    <FormGroup>
      <Label for="description">Description</Label>
      <Input type="textarea" name="description" />
    </FormGroup>
    <FormGroup>
      <Label for="time">Time (Enter in minutes)</Label>
      <Input type="select" name="time" step="15"></Input>
    </FormGroup>
    <FormGroup>
      <Label for="completed">Task Completed</Label>
      <Input type="checkbox" name="completed" />
    </FormGroup>
    <Button onClick={}>Create Task</Button>
  </div>;
}
