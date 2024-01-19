<script setup lang="ts">
import AddDocument from '@/components/icons/AddDocument.vue'
import LoginIcon from '@/components/icons/LoginIcon.vue'
import LogoutIcon from '@/components/icons/LogoutIcon.vue'
import RecipeListIcon from '@/components/icons/RecipeListIcon.vue'
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'
import Button from './ui/button/Button.vue'

const { isAuthenticated } = useUser()
const { logout } = useAuth()
</script>
<template>
  <header
    class="flex gap-4 justify-end items-center px-8 py-2 text-primary sticky top-0 bg-white z-10"
  >
    <router-link class="mr-auto text-primary-text" :to="{ name: 'home' }">Home</router-link>
    <router-link :to="{ name: 'newRecipe' }" v-slot="{ href, navigate }">
      <Button variant="outline" size="icon" :href="href" @click="navigate">
        <AddDocument />
      </Button>
    </router-link>
    <router-link :to="{ name: 'myRecipes' }" v-slot="{ href, navigate }">
      <Button variant="outline" size="icon" :href="href" @click="navigate">
        <RecipeListIcon />
      </Button>
    </router-link>
    <router-link v-if="!isAuthenticated" :to="{ name: 'login' }" v-slot="{ href, navigate }">
      <Button variant="outline" size="icon" :href="href" @click="navigate">
        <LoginIcon />
      </Button>
    </router-link>
    <Button variant="outline" size="icon" v-else @click="logout">
      <LogoutIcon />
    </Button>
  </header>
</template>
