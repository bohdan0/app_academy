import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {result: 0, num1: '', num2: ''};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.addNumbers = this.addNumbers.bind(this);
    this.substract = this.substract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  //your code here

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}></input>
        <input onChange={this.setNum2} value={this.state.num2}></input>
        <br />
        <button onClick={this.addNumbers}>+</button>
        <button onClick={this.substract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }

  setNum1(e){
    let num1 = parseInt(e.target.value);
    this.setState({num1});
  }

  setNum2(e){
    let num2 = parseInt(e.target.value);
    this.setState({num2});
  }

  addNumbers(event) {
    event.preventDefault();
    let result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  substract(event) {
    event.preventDefault();
    let result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  multiply(event) {
    event.preventDefault();
    let result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  divide(event) {
    event.preventDefault();
    let result = this.state.num1 / this.state.num2;
    this.setState({result});
  }
}

export default Calculator;
