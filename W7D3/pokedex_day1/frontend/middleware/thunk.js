import * as APIUtil from '../util/api_util';
import { receiveAllPokemon } from '../actions/pokemon_actions';

export default ({ dispatch }) => next => action => {

  if (typeof action === 'function') {
    return action(dispatch);
  } else {
    return next(action);
  }
};
