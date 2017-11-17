import {RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const itemReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      newState = {};
      return merge({}, state, action.pokemon.items);

      default:
        return state;
  }
};

export default itemReducer;
