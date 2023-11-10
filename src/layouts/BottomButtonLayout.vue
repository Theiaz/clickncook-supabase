<script setup lang="ts"></script>
<template>
  <div class="grid h-full gap-4">
    <section>
      <slot name="content"></slot>
    </section>

    <section class="self-end flex gap-4 justify-center">
      <slot name="actions"></slot>
    </section>
  </div>
</template>
<style scoped>
div {
  grid-template-rows: 1fr auto;
}
</style>
