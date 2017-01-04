export const fetchSearchGiphys = (term) => {
  return $.ajax({
    url: `http://api.giphy.com/v1/gifs/search?q=${term}&api_key=dc6zaTOxFJmzC&limit=2`,
    method: 'GET'
  });
};