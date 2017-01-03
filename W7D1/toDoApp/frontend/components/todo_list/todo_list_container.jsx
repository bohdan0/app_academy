import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { receiveTodo, receiveTodos, removeTodo} from '../../actions/todo_actions';

const mapStateToProps = (state) => (
  {
    todos: allTodos(state)
  }
);

const mapDispatchToProps = (dispatch) => (
  {
    receiveTodo: (a) => dispatch(receiveTodo(a)),
    receiveTodos: (a) => dispatch(receiveTodos(a)),
    removeTodo: (a) => dispatch(removeTodo(a))
  }
);

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
