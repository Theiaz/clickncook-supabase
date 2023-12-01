<script setup lang="ts">
import TheHeader from '@/components/TheHeader.vue'
</script>
<template>
  <TheHeader />
  <main class="px-8">
    <div class="h-full">
      <slot name="content"></slot>
    </div>
    <section class="flex gap-4 justify-center sticky bottom-0 bg-white pt-4 pb-8">
      <slot name="actions"></slot>
    </section>
  </main>
</template>
