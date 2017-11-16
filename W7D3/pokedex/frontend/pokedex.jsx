import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

//TODO Remove after debugging
import { selectAllPokemons } from './reducers/selectors';
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import Root from './components/root';

const debugFcts = (store) => {
  window.selectAllPokemons = selectAllPokemons;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
};

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);

  //TODO Remove after debugging
  debugFcts(store);
});
