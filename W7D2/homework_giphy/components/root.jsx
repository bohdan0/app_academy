import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => {
  return (
    <div>
      <Provider store={store}>
        <GiphysSearchContainer />
      </Provider>
    </div>
  );
};

export default Root;