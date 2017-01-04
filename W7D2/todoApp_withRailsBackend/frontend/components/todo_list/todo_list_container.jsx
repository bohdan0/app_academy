import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { createTodo, receiveTodos, deleteTodo, fetchTodos, updateTodo} from '../../actions/todo_actions';

const mapStateToProps = (state) => (
  {
    todos: allTodos(state),
    errors: state.errors
  }
);

const mapDispatchToProps = (dispatch) => (
  {
    createTodo: (a) => dispatch(createTodo(a)),
    receiveTodos: (a) => dispatch(receiveTodos(a)),
    deleteTodo: (a) => dispatch(deleteTodo(a)),
    fetchTodos: (a) => dispatch(fetchTodos(a)),
    updateTodo: (a) => dispatch(updateTodo(a))
  }
);

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
