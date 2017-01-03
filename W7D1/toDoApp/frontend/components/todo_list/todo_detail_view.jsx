import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <p>id: {this.props.todo.id}</p>
        <p>body: {this.props.todo.body}</p>
        <button onClick={() => this.props.removeTodo(this.props.todo.id)}>Remove</button>
      </div>
    );
  }
}

export default TodoDetailView;
