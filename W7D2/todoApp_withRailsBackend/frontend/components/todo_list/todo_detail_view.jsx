import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    console.log(this.props.todo);
    return (
      <div>
        <p>id: {this.props.todo.id}</p>
        <p>body: {this.props.todo.body}</p>
        <button onClick={() => this.props.deleteTodo(this.props.todo.id)}>Remove</button>

        <ul>
          {this.props.todo.tags.map((tag, i) => (
            <li key={i}>{tag.name}</li>
          ))}
        </ul>
      </div>
    );
  }
}

export default TodoDetailView;
