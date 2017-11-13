import React from 'react';

class Weather extends React.Component {

  constructor() {
    super();
    this.state = {

      weather: {
        lat: "",
        long: "",
        city: "",
        temp: ""
      },
      apiKey: "8b5c0440c6d7102974f70e63882afd41"
    };
  }

  render(){
    // console.log(this.state.weather);
    return(
      <div>
        <ul>
          <li>{this.state.weather.city}</li>
          <li>{this.state.weather.lat}</li>
          <li>{this.state.weather.long}</li>
        </ul>

      </div>
    );
  }
  componentDidMount() {
    navigator.geolocation.getCurrentPosition( (position) => {
      this.state.weather.lat = position.coords.latitude;
      this.state.weather.long = position.coords.longitude;
      this.httpRequest();
    });
  }

  urlBuilder(){
    let string = `http://api.openweathermap.org/data/2.5/weather?lat=${this.state.weather.lat}&lon=${this.state.weather.long}&APPID=${this.state.apiKey}`;
    return string;
  }

  httpRequest() {

    console.log("httpRequest");
    var request = new XMLHttpRequest();

    request.open('GET', this.urlBuilder(), true);
    request.onload = () => {
      if (request.status >= 200 && request.status < 400) {
        // Success!
        var resp = JSON.parse(request.responseText);
        console.log(resp);
        this.setState({
          weather:{
            city: resp.name
          }
        });
      } else {
        // We reached our target server, but it returned an error
        console.log('something else.');
      }
    };
    request.onerror = function() {
      // There was a connection error of some sort
    };
    request.send();
  }
}

export default Weather;
