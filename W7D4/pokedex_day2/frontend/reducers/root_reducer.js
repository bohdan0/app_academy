import { combineReducers } from 'redux';

import { pokemonReducer, pokemonDetailReducer } from './pokemon_reducer';

const rootReducer = combineReducers({
  pokemon: pokemonReducer,
  poke: pokemonDetailReducer
});

export default rootReducer;
