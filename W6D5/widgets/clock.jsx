import React from 'react';
import ReactDOM from 'react-dom';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };
  }

  componentDidMount() {
    this.interval = setInterval(() => {
      this.update();
    }, 1000);
  }

  update() {
    const time = new Date();
    this.setState({time});
  }

  render() {
    const time = this.state.time;
    return (
      <div className="clock">
        <h2>TIME: {time.toTimeString()}</h2>
        <h2>DATE: {time.toDateString()}</h2>
      </div>
    );
  }
}

export default Clock;