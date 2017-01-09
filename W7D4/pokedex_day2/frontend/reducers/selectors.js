import values from 'lodash/valuesIn';


export const selectAllPokemon = state => {
  return values(state.pokemon);
};

export const selectSinglePoke = state => {
  return values(state.poke);
};

export const selectPokeItem = (state, itemId) => {
  let result;

  state.poke.items.forEach(item => {
    if (item.id === parseInt(itemId)) result = item;
  });

  return result;
};
