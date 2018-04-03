import React from 'react';
import { Link } from 'react-router-dom';

function User(params) {
  return <p>{params.user.name} - <Link to={"/users/" + params.user.id}>tasks</Link></p>;
}

export default function Users(params) {
  let users = _.map(params.users, (uu) => <User key={uu.id} user={uu} />);
  return <div>
    {users}
  </div>;
}


//Attributuion: https://github.com/NatTuck/microblog-spa/blob/lec20-end/assets/js/cs/users.jsx
