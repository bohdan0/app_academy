import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { receiveTodo, receiveTodos, removeTodo} from '../../actions/todo_actions';

const mapDispatchToProps = (dispatch) => (
  {
    receiveTodo: (a) => dispatch(receiveTodo(a)),
    receiveTodos: (a) => dispatch(receiveTodos(a)),
    removeTodo: (a) => dispatch(removeTodo(a))
  }
);

export default connect(null, mapDispatchToProps)(TodoDetailView);
