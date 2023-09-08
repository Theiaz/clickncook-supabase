<script setup lang="ts">
import LogoutButton from '@/components/LogoutButton.vue'
import { useUser } from '@/composables/useUser'

const { isAuthenticated } = useUser()
</script>
<template>
  <header class="container">
    <router-link :to="{ name: 'home' }">Home</router-link>
    <router-link v-if="isAuthenticated" :to="{ name: 'myReceipts' }">My receipts</router-link>
    <LogoutButton />
  </header>
  <main class="container">
    <slot />
  </main>
  <footer class="container"></footer>
</template>
<style scoped>
header {
  display: flex;
  gap: 2rem;
  justify-content: end;
  align-items: center;
}
</style>
