import { useSession } from '@/composables/useSession'
import HomeView from '@/views/HomeView.vue'
import CreateView from '@/views/recipes/CreateView.vue'
import DetailsView from '@/views/recipes/DetailsView.vue'
import EditView from '@/views/recipes/EditView.vue'
import MyRecipesView from '@/views/recipes/MyRecipesView.vue'
import { createRouter, createWebHistory } from 'vue-router'

declare module 'vue-router' {
  interface RouteMeta {
    requiresAuth?: boolean
  }
}

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
      name: 'newRecipe',
      component: CreateView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/:id',
      name: 'details',
      props: true,
      component: DetailsView
    },
    {
      path: '/:id/edit',
      name: 'edit',
      props: true,
      meta: {
        requiresAuth: true
      },
      component: EditView
    },
    {
      path: '/my',
      name: 'myRecipes',
      component: MyRecipesView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/auth/RegistrationView.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/auth/LoginView.vue')
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    }
  ]
})
const { hasSession } = useSession()
router.beforeEach(async (to) => {
  if (to.meta.requiresAuth && !hasSession.value) {
    return {
      name: 'login',
      query: { redirect: to.fullPath }
    }
  }
})

export default router
