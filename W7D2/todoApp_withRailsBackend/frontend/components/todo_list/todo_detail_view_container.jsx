import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { receiveTodo, receiveTodos, deleteTodo} from '../../actions/todo_actions';

const mapDispatchToProps = (dispatch) => (
  {
    receiveTodo: (a) => dispatch(receiveTodo(a)),
    receiveTodos: (a) => dispatch(receiveTodos(a)),
    deleteTodo: (a) => dispatch(deleteTodo(a))
  }
);

export default connect(null, mapDispatchToProps)(TodoDetailView);
