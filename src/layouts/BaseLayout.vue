<script setup lang="ts">
import TheHeader from '@/components/TheHeader.vue'
</script>
<template>
  <div id="layout">
    <TheHeader />
    <main class="px-8 pb-8">
      <slot />
    </main>
  </div>
</template>
<style scoped>
#layout {
  @apply grid min-h-[100dvh];
  grid-template-rows: auto 1fr;
  grid-template-areas:
    'header'
    'main';
  height: 100dvh;
}

header {
  grid-area: header;
}

main {
  grid-area: main;
  overflow-y: scroll;
}
</style>
