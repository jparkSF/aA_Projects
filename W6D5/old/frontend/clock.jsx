import React from 'react';

class Clock extends React.Component{

  constructor(){
    super();
    this.state = {
      date: new Date()
    };

  }

  tick(){
    this.setState({date: new Date()});

  }

  componentDidMount() {
    this.inter = setInterval(this.tick.bind(this),1000);
  }

  componentWillUnmount(){
    clearInterval(this.inter);
  }

  render(){
    return(
      <div>
        <h1>Clock</h1>
        <p>{this.state.date.toString()}</p>
      </div>
    );
  }

}

export default Clock;
