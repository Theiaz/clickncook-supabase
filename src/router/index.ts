import { useUser } from '@/composables/useUser'
import CreateView from '@/views/CreateView.vue'
import DetailsView from '@/views/DetailsView.vue'
import EditView from '@/views/EditView.vue'
import HomeView from '@/views/HomeView.vue'
import MyRecipesView from '@/views/MyRecipesView.vue'
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
      meta: {
        requiresAuth: true
      },
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
      component: () => import('../views/AboutView.vue')
    }
  ]
})

const { isAuthenticated } = useUser()
router.beforeEach((to, from) => {
  if (to.meta.requiresAuth && !isAuthenticated.value) {
    return {
      name: 'login',
      query: { redirect: to.fullPath }
    }
  }
})

export default router
