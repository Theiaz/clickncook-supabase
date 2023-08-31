<script setup lang="ts">
import LogoutButton from '@/components/LogoutButton.vue'
</script>
<template>
  <header>
    <LogoutButton />
  </header>
  <main>
    <slot />
  </main>
  <footer></footer>
</template>
