import { Provider } from 'react-redux';
import store from './redux/store.js';

import './App.scss';
import Header from './components/header/Header.js';

const App = () => {
  return (
    <Provider store={store}>
      <Header />
      <div className="app">
        <h1>Redux</h1>
      </div>
    </Provider>
  );
};

export default App;
