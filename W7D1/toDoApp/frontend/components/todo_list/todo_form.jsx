import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: '', body: '', done: false};

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleFormInput = this.handleFormInput.bind(this);
  }

  handleFormInput(word) {
    return (event) => {
      const result = {};
      result[word] = event.currentTarget.value;
      this.setState(result);
    };
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({title: '', body: ''});
  }

  render() {
    return (
      <form>
        <label>
          Title:
          <input
            type="text"
            onChange={this.handleFormInput("title")}
            value={this.state.title}>
          </input>
        </label>

        <label>
          Body:
          <input
            type="text"
            onChange={this.handleFormInput("body")}
            value={this.state.body}>
          </input>
        </label>

        <button onClick={this.handleSubmit}>Create Todo</button>
      </form>
    );
  }
}

export default TodoForm;
