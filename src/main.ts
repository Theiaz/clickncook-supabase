import { FocusDirective } from '@/directives/v-focus'
import { createPinia } from 'pinia'
import { createApp } from 'vue'
import App from './App.vue'
import './assets/main.css'
import { useSession } from './composables/useSession'
import { initAppMonitoring } from './monitoring'
import router from './router'

// load session once before the app is initiliazed
const { hasSession, getSession } = useSession()
if (!hasSession.value) {
  await getSession()
}

const app = createApp(App)
// custom directives
app.directive('focus', FocusDirective)

if (import.meta.env.MODE === 'production') {
  initAppMonitoring(app)
}

const pinia = createPinia()
app.use(pinia)

app.use(router)

app.mount('#app')
