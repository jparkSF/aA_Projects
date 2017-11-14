import React from "react";
import ReactDom from "react-dom";
import configureStore from './store/store';
import {receiveTodo} from './actions/todo_action';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () =>{
  const roots = document.getElementById('root');
  window.store = configureStore;
  window.receiveTodo = receiveTodo;
  ReactDom.render(<Root store={configureStore} />, roots);
});
