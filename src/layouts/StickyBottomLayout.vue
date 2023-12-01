<script setup lang="ts">
import TheHeader from '@/components/TheHeader.vue'
</script>
<template>
  <div id="layout">
    <TheHeader />
    <main class="px-8 pb-4">
      <slot name="content"></slot>
    </main>
    <div id="actionbar" class="flex gap-4 justify-center sticky bottom-0 bg-white pt-4 pb-8">
      <slot name="actions"></slot>
    </div>
  </div>
</template>
<style scoped>
#layout {
  @apply grid min-h-[100dvh];
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    'header'
    'main'
    'actionbar';
  height: 100dvh;
}

header {
  grid-area: header;
}

main {
  grid-area: main;
  overflow-y: scroll;
}

#actionbar {
  grid-area: actionbar;
}
</style>
