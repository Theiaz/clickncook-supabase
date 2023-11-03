<script setup lang="ts">
import AddIcon from '@/components/icons/AddIcon.vue'
import LoginIcon from '@/components/icons/LoginIcon.vue'
import LogoutIcon from '@/components/icons/LogoutIcon.vue'
import RecipeListIcon from '@/components/icons/RecipeListIcon.vue'
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'

const { isAuthenticated } = useUser()
const { logout } = useAuth()
</script>
<template>
  <header class="flex gap-4 justify-end items-center p-8 pb-4">
    <router-link class="mr-auto" :to="{ name: 'home' }">Home</router-link>
    <router-link :to="{ name: 'newRecipe' }">
      <AddIcon />
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
  <main class="px-8 pb-4">
    <slot />
  </main>
</template>
