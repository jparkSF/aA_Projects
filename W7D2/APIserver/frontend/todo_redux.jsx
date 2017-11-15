import React from "react";
import ReactDom from "react-dom";
import configureStore from './store/store';
import {receiveTodo, fetchTodos} from './actions/todo_action';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () =>{
  const root = document.getElementById('root');
  window.store = configureStore;
  window.receiveTodo = receiveTodo;
  window.fetchTodos = fetchTodos;
  ReactDom.render(<Root store={configureStore} />, root);
});
