import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import allTodos from './reducers/selectors';
import { receiveTodo, receiveTodos, fetchTodos } from './actions/todo_actions';
import Root from './components/root';
import { request } from './util/todo_api_util';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  window.request = request;
  window.receiveTodos = receiveTodos;
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
});
