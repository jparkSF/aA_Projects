import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import { HashRouter, Route } from 'react-router-dom';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <div>
        <h2>The Pokedex</h2>
        <Route path="/" component={PokemonIndexContainer} />
      </div>
    </HashRouter>
  </Provider>
);

export default Root;
