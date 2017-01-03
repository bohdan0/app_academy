import React from 'react';

import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    // debugger
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.todos.map((todo, idx) => (
            <TodoListItem
              todo ={todo}
              title={todo.title}
              id={todo.id}
              key={idx}
              removeTodo={this.props.removeTodo}
              receiveTodo={this.props.receiveTodo}/>
          ))}
        </ul>

        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

export default TodoList;
