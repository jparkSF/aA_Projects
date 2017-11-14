import React from 'react';


export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';


export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos: todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo: todo
});

// export default receiveTodo;

//
// store.getState(); // should return default state object
// store.dispatch(receiveTodo({ id: 3, title: 'New Todo' }));
// store.getState(); // should include the newly added todo
// store.dispatch(receiveTodos(newTodos));
// store.getState(); // should return only the new todos
