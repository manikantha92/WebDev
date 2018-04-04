import React from 'react';
import { NavLink } from 'react-router-dom';
import { Form, FormGroup, NavItem, Input, Button } from 'reactstrap';
import { connect } from 'react-redux';
import api from '../api';

let Session = connect(({token}) => {return {token};})((props) => {
  function remove_token(){
    let act = {
      type: 'REMOVE_TOKEN'
    };
    props.prop.dispatch(act);
  }

  return <div>
    <span className="links p-blue inline1" >Logged in as { props.token.user_name } | </span>
    <NavLink to="/" href="#" className="nav-link links inline1" onClick={remove_token}>Logout</NavLink> </div>;
});

function Nav(props) {
  let session_info;

  if (props.token) {
    session_info = <Session token={props.token} prop={props} />;
  }
  else {

    session_info =
    <div>
    <ul className="navbar-nav mr-auto">
      <NavItem>
        <NavLink to="/login" href="#" className="nav-link links" onClick={clearuserdata}>Login</NavLink>
      </NavItem>
      <NavItem>
        <NavLink to="/adduser" href="#" className="nav-link links" onClick={clearuserdata}>Register</NavLink>
      </NavItem>
      </ul></div>;
  }
  function clearuserdata() {
    let act = {
      type: 'CLEAR_FORM',
    };
    props.dispatch(act);
    let act1 = {
      type: 'CLEAR_USER_ERROR',
    };
    props.dispatch(act1);
    let act2 = {
      type: 'CLEAR_LOGIN',
    };
    props.dispatch(act2);
  }

  function cleardata() {
    let act = {
      type: 'CLEAR_TASK_ERROR',
    };
    props.dispatch(act);
  }

  return (
    <nav className="navbar navbar-dark bg-dark navbar-expand">
      <span className="navbar-brand head1">
        TasktrackerSPA
      </span>
      <ul className="navbar-nav mr-auto">
        <NavItem>
          <NavLink to="/" exact={true} activeClassName="active" className="nav-link links">All Tasks</NavLink>
        </NavItem>
        <NavItem>
          {props.token? <NavLink to="/tasks/new" className="nav-link links" onClick={cleardata}>New Task</NavLink> : ""}
        </NavItem>
        <NavItem>
          {props.token? <NavLink to="/users" className="nav-link links">Users</NavLink> : ""}
        </NavItem>
      </ul>
      { session_info }
    </nav>
  );
}

function state2props(state) {
  return {
    token: state.token
  };
}

export default connect(state2props,null,null,{pure: false})(Nav);
//Attribution: https://github.com/NatTuck/microblog-spa/blob/lec20-end/assets/js/cs/nav.jsx
