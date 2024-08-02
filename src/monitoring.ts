import * as Sentry from '@sentry/vue'
import type { App } from 'vue'

const initAppMonitoring = (app: App) =>
  Sentry.init({
    app,
    dsn: 'https://ab990ff9b0e7ad987ed329038dff51d2@o4507707540570112.ingest.de.sentry.io/4507707542601808',
    integrations: [Sentry.browserTracingIntegration(), Sentry.replayIntegration()],
    // Performance Monitoring
    tracesSampleRate: 1.0, //  Capture 100% of the transactions
    // Set 'tracePropagationTargets' to control for which URLs distributed tracing should be enabled
    tracePropagationTargets: ['localhost', /^https:\/\/yourserver\.io\/api/],
    // Session Replay
    replaysSessionSampleRate: 0.1, // This sets the sample rate at 10%. You may want to change it to 100% while in development and then sample at a lower rate in production.
    replaysOnErrorSampleRate: 1.0 // If you're not already sampling the entire session, change the sample rate to 100% when sampling sessions where errors occur.
  })

export { initAppMonitoring }
