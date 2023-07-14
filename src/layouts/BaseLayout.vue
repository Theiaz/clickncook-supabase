<script setup lang="ts">
import LogoutForm from '@/components/LogoutForm.vue'
</script>
<template>
  <header>
    <LogoutForm />
  </header>
  <main>
    <slot />
  </main>
  <footer>Footer</footer>
</template>
