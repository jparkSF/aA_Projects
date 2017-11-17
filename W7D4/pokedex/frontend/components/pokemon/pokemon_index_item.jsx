import React from 'react';
import { Link } from 'react-router-dom';


const pokemonIndexItem = (props) => (

  <li>
    <Link to={`/pokemon/${props.pokemon.id}`}>
      <img className="img" src={props.pokemon.image_url}></img>
      <br/>
      {props.pokemon.name}
      <br/><h1></h1>

    </Link>
  </li>
);

export default pokemonIndexItem;
