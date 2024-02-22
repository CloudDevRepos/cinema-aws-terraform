import React from 'react';
import ReactDOM from 'react-dom/client';
import { Provider } from 'react-redux';
import * as Sentry from '@sentry/browser';
import './index.scss';
import App from './App';
import store from './redux/store';

Sentry.init({
  dsn: process.env.REACT_APP_SENTRY_DSN,
  beforeBreadcrumb(breadcrumb, hint) {
    return breadcrumb.category === 'ui.click' ? null : breadcrumb;
  }
});

// if (process.env.NODE_ENV === 'production') {
//   Sentry.init({
//     dsn: process.env.REACT_APP_SENTRY_DSN,
//     integrations: [
//       Sentry.browserTracingIntegration(),
//       Sentry.replayIntegration()
//     ],
//     tracesSampleRate: 1.0,
//     replaysSessionSampleRate: 0.1,
//     replaysOnErrorSampleRate: 1.0,
//     beforeBreadcrumb(breadcrumb, hint) {
//       return breadcrumb.category === 'ui.click' ? null : breadcrumb;
//     }
//   });
// }

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);
