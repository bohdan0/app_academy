import React from 'react';
import ReactDOM from 'react-dom';

class Weather extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let weather = this.props.data;

    if (weather) {
      let name = weather.name;
      let temp = (weather.main.temp - 273.15) * 1.8 + 32;
      let humidity = weather.main.humidity;

      return (
        <div className="weather">
          <h2>City: {name}</h2>
          <h2>Temp: {temp.toFixed(1)} F</h2>
          <h2>Humidity: {humidity} %</h2>
        </div>
      );
    } else {
      return (
        <div className="weather">
          <h2>Weather is Loading...</h2>
        </div>
      );
    }
  }
}

export default Weather;