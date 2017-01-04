import todosReducer from './todos_reducer';
import { errorReducer } from './error_reducer';
import { combineReducers } from 'redux';

const rootReducer = combineReducers(
  {
    todos: todosReducer,
    errors:  errorReducer
  }
);

export default rootReducer;
