import React from 'react';
import { NavLink } from 'react-router-dom';
import { NavItem } from 'reactstrap';

export default function Nav(props) {
  if (props.loggedin_user == null) {
    return (
      <nav className="navbar navbar-dark bg-dark navbar-expand">
        <span className="navbar-brand">
          TaskTracker
        </span>
      </nav>
    );
  } else {
    return (
      <nav className="navbar navbar-dark bg-dark navbar-expand">
        <span className="navbar-brand">
          TaskTracker
        </span>
        <ul className="navbar-nav mr-auto">
          <NavItem>
            <NavLink to="/" exact={true} activeClassName="active" className="nav-link">Tasks</NavLink>
          </NavItem>
          <NavItem>
            <NavLink to="/users" href="#" className="nav-link">Users</NavLink>
          </NavItem>
        </ul>
        <span className="navbar-text">
          {props.loggedin_user.name}
        </span>
      </nav>
    );
  }
}

//Attribution: https://github.com/NatTuck/microblog-spa/blob/lec20-end/assets/js/cs/nav.jsx
