import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKE = 'RECEIVE_SINGLE_POKE';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePoke = poke => ({
  type: RECEIVE_SINGLE_POKE,
  poke
});

export const requestAllPokemon = () => dispatch => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePoke = id => dispatch => {
  return APIUtil.requestSinglePoke(id)
    .then(poke => dispatch(receiveSinglePoke(poke)));
};
