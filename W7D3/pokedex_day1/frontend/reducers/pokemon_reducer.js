import merge from 'lodash/merge';

import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  // let newState = {};

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      // newState = merge({}, state, action.pokemon);
      return action.pokemon;
      // return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
