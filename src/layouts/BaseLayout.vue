<script setup lang="ts">
import LogoutButton from '@/components/LogoutButton.vue'
</script>
<template>
  <header class="container">
    <LogoutButton />
  </header>
  <main class="container">
    <slot />
  </main>
  <footer class="container"></footer>
</template>
