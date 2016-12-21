console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=LA,LA&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  success(weather) {
    console.log(`${weather.name} has ${weather.main.humidity} % humidity`);
    console.log(`${weather.name} has ${weather.wind.speed} m/hr wind`);
    console.log(`${weather.name} has ${weather.weather[0].description}`);
    console.log(weather);
  }
});
// Add another console log here, outside your AJAX request
console.log('Ajax request is running right now while it gets printing');
