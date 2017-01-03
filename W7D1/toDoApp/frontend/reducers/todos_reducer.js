import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  const newState = {};
  switch(action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((todo) => (
        newState[todo.id] = todo
      ));
      return newState;
    case RECEIVE_TODO:
      if (action.todo.id){
        newState[action.todo.id] = action.todo;
      } else {
        let id = Object.keys(state).length;
        action.todo.id = id + 1;
        newState[id + 1] = action.todo;
      }
      return merge({}, state, newState);
    case REMOVE_TODO:
      Object.keys(state).forEach((key) => {
        if (parseInt(key) !== action.id) {
          newState[key] = state[key];
        }
      });
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
