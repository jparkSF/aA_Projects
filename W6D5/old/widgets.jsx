import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';


document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<ALL />, root);
	// ReactDOM.render('hello world', root);
});


class ALL extends React.Component{
	render(){
		return (
			<div>
				<Clock />
				<Tabs />
				<Weather />
			</div> 
		);
	}
}


