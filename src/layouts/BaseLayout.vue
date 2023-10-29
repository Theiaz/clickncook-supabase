<script setup lang="ts">
import LogoutButton from '@/components/LogoutButton.vue'
import { useUser } from '@/composables/useUser'

const { isAuthenticated } = useUser()
</script>
<template>
  <header class="flex gap-4 justify-end items-center">
    <router-link :to="{ name: 'home' }">Home</router-link>
    <router-link v-if="isAuthenticated" :to="{ name: 'myRecipes' }">My recipes</router-link>
    <router-link v-if="!isAuthenticated" :to="{ name: 'login' }">Login</router-link>
    <LogoutButton />
  </header>
  <main class="container">
    <slot />
  </main>
  <footer class="container"></footer>
</template>
