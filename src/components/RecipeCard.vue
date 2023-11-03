<script setup lang="ts">
import type { Recipe } from '@/types/recipe'
import ImageCarousel from './ImageCarousel.vue'

const props = defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <article>
    <header>
      <ImageCarousel :images="recipe!.images" />
      <h2>{{ props.recipe.name }}</h2>
    </header>
    <p>{{ props.recipe.description }}</p>
  </article>
</template>
