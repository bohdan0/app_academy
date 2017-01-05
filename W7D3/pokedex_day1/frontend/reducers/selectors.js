import valuesIn from 'lodash/valuesIn';


export const selectAllPokemon = (state) => {
  return valuesIn(state.pokemon);
};
