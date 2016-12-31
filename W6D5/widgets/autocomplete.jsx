import React from 'react';
import ReactDOM from 'react-dom';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {str: "", input: props.names};
    this.handleChange = this.handleChange.bind(this);
    this.moveToInput = this.moveToInput.bind(this);
  }

  names() {
    return this.state.input.map((name, idx) => {
      return (
        <li key={idx} onClick={this.moveToInput}>{name}</li>
      );
    });
  }

  moveToInput(event) {
    event.preventDefault();
    let str = event.currentTarget.innerHTML;
    this.setState({input: []});
    this.setState({str});
  }

  handleChange(event) {
    event.preventDefault();
    let str = event.currentTarget.value;
    this.findMathes(str);
    if (str === '') this.setState({input: this.props.names});
    this.setState({str});
  }

  findMathes(str) {
    let input = [];
    this.props.names.forEach(name => {
      if (name.slice(0, str.length) === str) input.push(name);
    });

    this.setState({input});
  }

  render() {
    return (
      <div className="autocomplete">
        <input type="text" onChange={this.handleChange} value={this.state.str}/>
        <br/>
        <br/>
        <ul>
          {this.names()}
        </ul>
      </div>
    );
  }
}

export default Autocomplete;