import { useUser } from '@/composables/useUser'
import CreateReceiptView from '@/views/CreateReceiptView.vue'
import HomeView from '@/views/HomeView.vue'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/new',
      name: 'newReceipt',
      component: CreateReceiptView
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/RegistrationView.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginView.vue')
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    }
  ]
})

const { isAuthenticated } = useUser()
router.beforeEach(async (to, from) => {
  if (!isAuthenticated.value && to.name !== 'login' && to.name !== 'register') {
    return { name: 'login' }
  }
})

export default router
