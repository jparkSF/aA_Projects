import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

//TODO Remove after debugging
import { selectAllPokemons } from './reducers/selectors';
import { fetchAllPokemon, fetchSinglePokemon } from './util/api_util';
import {
  receiveAllPokemon,
  requestAllPokemon,
  receiveSinglePokemon,
  requestSinglePokemon,
} from './actions/pokemon_actions';


const debugFcts = (store) => {
  window.selectAllPokemons = selectAllPokemons;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.fetchSinglePokemon = fetchSinglePokemon;
  window.receiveSinglePokemon = receiveSinglePokemon;
  window.requestSinglePokemon = requestSinglePokemon;
};

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);

  //TODO Remove after debugging
  debugFcts(store);
});
