import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, hashHistory } from 'react-router';

import App from './app';
import SessionFormContainer from './session/session_form_container';

const _redirectIfLoggedIn = (nextState, replace) => {
  // store is on window in entry file
  if (store.getState().session.currentUser) replace('/');
};

const Root = ({ store }) => (
  <Provider store={ store }>
    <Router history={ hashHistory }>
      <Route path='/' component={ App }>
        <Route path='/login' 
               component={ SessionFormContainer } 
               onEnter={ _redirectIfLoggedIn }/>
        <Route path='/signup' 
               component={ SessionFormContainer } 
               onEnter={ _redirectIfLoggedIn } />
      </Route>
    </Router>
  </Provider>
);

export default Root;
