import React from 'react';
import ReactDOM from 'react-dom';

import Tabs from './tabs';
import Clock from './clock';
import Weather from './weather';
import Autocomplete from './autocomplete';

const Panes = [
  {title: 'one', content: 'I am first'},
  {title: 'two', content: 'I am second'},
  {title: 'three', content: 'I am third'}
];

const WeatherAPI = (lat, lon, cb) => {
  let request = new XMLHttpRequest();

  request.onreadystatechange = () => {
    if (request.status === 200 && request.readyState === XMLHttpRequest.DONE) {
      cb(JSON.parse(request.responseText));
    }
  };

  let url = "http://api.openweathermap.org/data/2.5/weather?";
  url += `lat=${lat}&lon=${lon}`;

  url += "&APPID=9e817d1d7d280de927c9b138daee35ef";

  request.open(
    "GET", 
    url, 
    true
  );
  request.send();
};

const Location = (api, cb) => {
  navigator.geolocation.getCurrentPosition(pos => {
    api(pos.coords.latitude, pos.coords.longitude, cb);
  });
};

const WeatherByLocation = (cb) => {
  return Location(WeatherAPI, cb);
};

const Names = [
  'Bob',
  'Den',
  'Rob',
  'Rick',
  'Robert'
];

class Root extends React.Component {
  constructor(props) {
    super(props);
    this.state = {data: undefined};
    this.getWeather();
  }

  getWeather() {
    WeatherByLocation(data => this.setState({data}));
  }

  render() {
    return (
      <div>
        <Tabs panes={Panes} />
        <Clock />
        <Autocomplete names={Names}/>
        <Weather data={this.state.data}/>
      </div>
    );
  }
}

export default Root;