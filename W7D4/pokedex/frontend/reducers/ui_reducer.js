import {RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const uiReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

  switch(action.type) { 
    case RECEIVE_SINGLE_POKEMON:
    // TODO wat?

    default:
      return state;
  }
};

export default uiReducer;
