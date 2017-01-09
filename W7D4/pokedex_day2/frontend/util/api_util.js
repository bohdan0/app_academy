export const fetchAllPokemon = () => {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  });
};

export const requestSinglePoke = (id) => {
  return $.ajax({
    url: `/api/pokemon/${id}`,
    method: 'GET'
  });
};

export const createPokemon = (pokemon) => {
  return $.ajax({
    url: `/api/pokemon`,
    method: 'POST',
    data: { pokemon }
  });
};
