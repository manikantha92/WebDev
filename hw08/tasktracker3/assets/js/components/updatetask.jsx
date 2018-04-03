import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';

export default function TaskEdit(params) {

  let task = params.task;

  return <div style={{padding: "4ex"}}>
    <h2>Edit Task</h2>
    <FormGroup>
      <Label for="user_id">User</Label>
      <Input plaintext>{task.user.name}</Input>
    </FormGroup>
    <FormGroup>
      <Label for="title">Title</Label>
      <Input plaintext>{task.title}<Input />
    </FormGroup>
    <FormGroup>
      <Label for="description">Description</Label>
      <Input plaintext>{task.description}</Input>
    </FormGroup>
    <FormGroup>
      <Label for="time">Time (Enter in minutes)</Label>
      <Input type="select" name="time" step="15"></Input>
    </FormGroup>
    <FormGroup>
      <Label for="completed">Task Completed</Label>
      <Input type="checkbox" name="completed" />
    </FormGroup>
    <Button onClick={}>Update Task</Button>
  </div>;
}
