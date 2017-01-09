import merge from 'lodash/merge';

import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKE } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    default:
      return state;
  }
};

export const pokemonDetailReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_SINGLE_POKE:
      return action.poke;
    default:
      return state;
  }
};
