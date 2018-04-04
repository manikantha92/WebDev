import React from 'react';
import { connect } from 'react-redux';
import { Route, Redirect } from 'react-router';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import api from '../api';

function AddUser(params) {
  function update(ev) {
    let tgt = $(ev.target);

    let data = {};
    data[tgt.attr('name')] = tgt.val();
    let act = {
      type: 'UPDATE_FORM',
      data: data,
    };
    console.log(act);
    params.dispatch(act);
  }

  function submit(ev) {
    api.register_user(params.form);
  }

  function clearuserdata() {
    let act = {
      type: 'CLEAR_FORM',
    };
    params.dispatch(act);
    let act1 = {
      type: 'CLEAR_USER_ERROR',
    };
    params.dispatch(act1);
  }

  return <div style={ {padding: "4ex"} }>
    <FormGroup>
      <Label for="email">Email</Label>
      <Input type="email" className="form-control" name="email" placeholder="abc@example.com" value={params.form.email} onChange={update}/>
      <span>{params.errors.email[0]}</span>
    </FormGroup>
    <FormGroup>
      <Label for="name">Name</Label>
      <Input className="form-control" name="name" value={params.form.name} onChange={update}/>
      <span>{params.errors.name[0]}</span>
    </FormGroup>
    <FormGroup>
      <Label for="password">Password</Label>
      <Input type="password" className="form-control" name="password" value={params.form.password} onChange={update}/>
      <span>{params.errors.password[0]}</span>
    </FormGroup>
    <FormGroup>
      <Label for="password_confirmation">Confirm Password</Label>
      <Input type="password" className="form-control" name="password_confirmation" value={params.form.password_confirmation} onChange={update}/>
      <span>{params.errors.password_confirmation[0]}</span>
    </FormGroup>
    <Button className="btn btn-primary" id="register" onClick={submit}>Register</Button>&nbsp;&nbsp;&nbsp;
    <Button className="btn btn-primary" id ="clear"onClick={clearuserdata}>Clear</Button> </div>;
}

function state2props(state) {
  console.log("rerender", state);
  return {
    form: state.form,
    errors: state.user_errors,
  };
}

export default connect(state2props)(AddUser);
