export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import * as APIUtil from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = (id) => ({
  type: REMOVE_TODO,
  id
});

export const fetchTodos = () => (dispatch) => {
  APIUtil.fetchTodos(res => dispatch(receiveTodos(res)),
                     err => console.log(err));
};

export const createTodo = (todo) => (dispatch) => (
  APIUtil.createTodo(todo)
                     .then(res => {
                       dispatch(receiveTodo(res));
                       dispatch(clearErrors());
                       },
                      err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateTodo = (todo) => dispatch => (
  APIUtil.updateTodo(todo)
                      .then(res => dispatch(receiveTodo(res)),
                            err => console.log(err))
);

export const deleteTodo = (todo) => dispatch => (
  APIUtil.deleteTodo(todo)
                      .then(res => dispatch(removeTodo(res.id)),
                            err => console.log(err))
);
