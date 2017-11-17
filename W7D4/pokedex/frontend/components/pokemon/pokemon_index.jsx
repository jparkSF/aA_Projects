import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render () {
    const pokemonIndex = this.props.pokemon.map(poke =>
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    );

    return (
      <div>
        <ul>
          {pokemonIndex}
        </ul>
      </div>
  );
  }
}

export default PokemonIndex;
