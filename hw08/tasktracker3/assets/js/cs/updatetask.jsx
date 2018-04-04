import React from 'react';
import { connect } from 'react-redux';
import { Route, Redirect } from 'react-router';
import { NavLink } from 'react-router-dom';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import api from '../api';

function UpdateTask(params) {

  function update(ev) {

    let data = {};
    let tgt = $(ev.target);

    data[tgt.attr('name')] = tgt.val();
    data["user_id"] = params.token.user_id;
    let act = {
      type: 'UPDATE_EDITTASK_FORM',
      data: data,
    };
    params.dispatch(act);
  }

  function update_checkBox(ev) {
    let toggle = !params.form.completed;
      let data = {};
      data["completed"] = toggle;
      let act = {
        type: 'UPDATE_EDITTASK_FORM',
        data: data,
      };

      params.dispatch(act);
    }

  function submit(ev) {
    api.update_task(params.form,params.form.id);

  }
  let users = _.map(params.users, (uu) => <option key={uu.id} value={uu.id}>{uu.email}</option>);
  return <div style={ {padding: "4ex"} }>
    <h2>Edit Task</h2>
    <FormGroup>
      <Label for="title">Title</Label>
      <Input type="text" className="form-control" name="title" value={params.form.title} onChange={update}/>
      <span>{params.errors.title}</span>
    </FormGroup>
    <FormGroup>
      <Label for="description">Description</Label>
      <Input type="textarea" className="form-control" name="description" value={params.form.description} onChange={update}/>
      <span>{params.errors.description}</span>
    </FormGroup>
    <FormGroup>
      <Label for="assigned_to">Assigned To</Label>
    <Input type="select" name="assigned_to" value={params.form.assigned_to} onChange={update}>
      <option>Select</option>
      {users}
    </Input>
    <span>{params.errors.assigned_to}</span>
    </FormGroup>
    <FormGroup>
      <Label for="time">Time</Label>
      <Input type="number" step="15" className="form-control" name="time" value={params.form.time} onChange={update}/>
      <span>{params.errors.time}</span>
    </FormGroup>
    <FormGroup>
      <Label for="completed" className="label1 inline1" >Completed</Label>
      <Input type="checkbox" className="inline1" name="completed" checked={params.form.completed}  onChange={update_checkBox}/>
    </FormGroup>
    <div>
    <Button className="btn btn-primary inline1" id="register" color="btn-primary" onClick={submit}>Submit</Button>
    <NavLink className="nav-link inline1" to="/">Cancel</NavLink>
    </div></div>;
}

function state2props(state) {
  console.log("rerender", state);
  return {
    form: state.update_task_form,
    errors: state.task_errors,
    token: state.token,
    users: state.users,
  };
}

export default connect(state2props)(UpdateTask);
