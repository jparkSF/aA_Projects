import {createStore, applyMiddleWare, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunkMiddleWare from '../middleware/thunk';
import logger from 'redux-logger';

const configureStore = createStore(rootReducer, applyMiddleware(thunkMiddleWare), applyMiddleware(logger));


export default configureStore;
