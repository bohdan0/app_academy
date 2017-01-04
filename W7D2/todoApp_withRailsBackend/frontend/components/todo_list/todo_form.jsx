import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: '', body: '', done: false, tag_names: []};

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleFormInput = this.handleFormInput.bind(this);
    this.addTag = this.addTag.bind(this);
  }

  addTag(event) {
    let tag_names = [...this.state.tag_names, this.refs.newTag.value];
    this.setState({ tag_names });
    this.refs.newTag.value = '';
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
    this.props.createTodo(this.state).then(
      () => this.setState({title: '', body: '', tag_names: []})
    );
  }

  render() {
    return (
      <div>
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

          <label>
            Tags:
            <ul>
              {this.state.tag_names.map((tag, i) => (
                <li key={i}>{tag}</li>
              ))}
            </ul>
          </label>

          <input type="text" ref="newTag"></input>
          <button onClick={this.addTag} type="button">Add Tag</button>

          <button onClick={this.handleSubmit}>Create Todo</button>
        </form>
        <ul>
          {this.props.errors.map((error, idx) => (
            <li key={idx}>{error}</li>
          ))}
        </ul>
      </div>

    );
  }
}

export default TodoForm;
