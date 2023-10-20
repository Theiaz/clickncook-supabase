<script setup lang="ts">
import type { Recipe } from '@/types/recipe'
import ImageCarousel from './ImageCarousel.vue'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <h2>{{ recipe.name }}</h2>
  <ImageCarousel :images="recipe.images" />
  <div>{{ recipe.description }}</div>
</template>
