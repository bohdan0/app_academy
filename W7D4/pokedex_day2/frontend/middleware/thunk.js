import * as APIUtil from '../util/api_util';

export default ({ dispatch }) => next => action => {

  if (typeof action === 'function') {
    return action(dispatch);
  } else {
    return next(action);
  }
};
