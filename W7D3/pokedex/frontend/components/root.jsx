import React from 'react';
import { Provider } from 'react-redux';
// import { selectAllPokemons } from '../reducers/selectors';

const Root = ({ store }) => (
  <Provider store={store}>
    <div>hello</div>
  </Provider>
);

export default Root;
