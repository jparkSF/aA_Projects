import React from 'react';


const allTodos = (state) => {
  const keys = Object.keys(state.todos);

  const newArray = [];

  keys.forEach((key) => {
    newArray.push(state.todos[key]);
  });

  return newArray;
};  

export default allTodos;
