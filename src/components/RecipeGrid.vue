<script setup lang="ts"></script>
<template>
  <div class="recipe-container">
    <div class="recipe">
      <div class="flex flex-col gap-4">
        <slot name="left" />
      </div>
      <div class="flex flex-col gap-4">
        <slot name="right" />
      </div>
    </div>
  </div>
</template>
<style scoped>
.recipe-container {
  container-name: recipe;
  container-type: inline-size;
}
.recipe {
  @apply grid gap-4;
}
@container recipe (width > 700px) {
  .recipe {
    @apply grid-rows-1 grid-cols-2 gap-8 max-w-[120ch] place-content-center mx-auto;
  }
}
</style>
