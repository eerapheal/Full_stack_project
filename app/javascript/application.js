// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import React from 'react';
import ReactDOM from 'react-dom';

const  App = () => {
  return (
    <>
    <h1>Hello hassina!</h1>
    <h1>Hello james!</h1>
    <h1>Hello Gilbert!</h1>
    <h1>Welcome to Final capstone project. greetings from Ralph</h1>
    </>
  );
}

ReactDOM.render(
  <App/>,
  document.getElementById('root'),
);
