import { FocusDirective } from '@/directives/v-focus'
import { createPinia } from 'pinia'
import { createApp } from 'vue'
import App from './App.vue'
import './assets/main.css'
import router from './router'

const app = createApp(App)
// custom directives
app.directive('focus', FocusDirective)

const pinia = createPinia()
app.use(pinia)

app.use(router)

app.mount('#app')
