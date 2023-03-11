import React from 'react';
import ReactDOM from 'react-dom';
import Home from './src/components/Home';
import { Routes, Route } from 'react-router-dom';

const  App = () => {
  return (
    <Routes>
    <Route path="/" element={<Home />} />
  </Routes>
  );
};

export default App;