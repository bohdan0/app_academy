import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

const toggleDone = (todo) => {
  todo.done = !todo.done;
  return todo;
};

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {detail: false};

    this.toggleDetail = this.toggleDetail.bind(this);
  }

  toggleDetail() {
    const detail = !this.state.detail;
    this.setState({detail});
  }

  render() {
    return (
      <li key={this.props.todo.id}>
        <h3 onClick={this.toggleDetail}>{this.props.todo.title}</h3>
        <button onClick={() => this.props.receiveTodo(toggleDone(this.props.todo))}>{this.props.todo.done ? "Undo": "Done"}</button>
        {this.state.detail ? <TodoDetailViewContainer todo={this.props.todo}/> : ""}
      </li>
    );
  }
}

export default TodoListItem;
