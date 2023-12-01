<script setup lang="ts">
import TheHeader from '@/components/TheHeader.vue'
</script>
<template>
  <TheHeader />
  <main class="px-8 pb-8">
    <slot />
  </main>
</template>
