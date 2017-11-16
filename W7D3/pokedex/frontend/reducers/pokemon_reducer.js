import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
// import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = {};

      Object.keys(action.pokemon).forEach(key => {
        newState[key] = action.pokemon[key];
      });
      return newState;

    default:
      return state;
  }
};

export default pokemonReducer;
