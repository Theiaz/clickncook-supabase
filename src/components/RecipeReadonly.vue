<script setup lang="ts">
import type { Recipe } from '@/types/recipe'

defineProps<{
  recipe: Recipe
}>()

// TODO schaefer - duplicated inside image upload
function toSrc(file: File) {
  return URL.createObjectURL(file)
}
</script>
<template>
  <h2>{{ recipe.name }}</h2>
  <template v-for="image in recipe.images" :key="image.name">
    <img :src="toSrc(image)" :alt="image.name" />
  </template>

  <div>{{ recipe.description }}</div>
</template>
