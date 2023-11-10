<script setup lang="ts">
import AddDocument from '@/components/icons/AddDocument.vue'
import LoginIcon from '@/components/icons/LoginIcon.vue'
import LogoutIcon from '@/components/icons/LogoutIcon.vue'
import RecipeListIcon from '@/components/icons/RecipeListIcon.vue'
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'

const { isAuthenticated } = useUser()
const { logout } = useAuth()
</script>
<template>
  <header class="flex gap-4 justify-end items-center px-6 py-2 text-primary">
    <router-link class="mr-auto text-primary-text" :to="{ name: 'home' }">Home</router-link>
    <router-link :to="{ name: 'newRecipe' }">
      <AddDocument />
    </router-link>
    <router-link v-if="isAuthenticated" :to="{ name: 'myRecipes' }">
      <RecipeListIcon />
    </router-link>
    <router-link v-if="!isAuthenticated" :to="{ name: 'login' }">
      <LoginIcon />
    </router-link>
    <button v-else @click="logout">
      <LogoutIcon />
    </button>
  </header>
  <main class="px-8 pb-8">
    <slot />
  </main>
</template>
