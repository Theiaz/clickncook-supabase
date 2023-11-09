import { useUser } from '@/composables/useUser'
import CreateRecipeView from '@/views/CreateRecipeView.vue'
import HomeView from '@/views/HomeView.vue'
import MyRecipesView from '@/views/MyRecipesView.vue'
import RecipeDetailsEditView from '@/views/RecipeDetailsEditView.vue'
import RecipeDetailsReadView from '@/views/RecipeDetailsReadView.vue'
import RecipeDetailsView from '@/views/RecipeDetailsView.vue'
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
      component: CreateRecipeView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/:id',
      component: RecipeDetailsView,
      props: true,
      meta: {
        requiresAuth: true
      },
      children: [
        {
          path: '/:id',
          name: 'details',
          component: RecipeDetailsReadView
        },
        {
          path: '/:id/edit',
          name: 'edit',
          component: RecipeDetailsEditView
        }
      ]
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
