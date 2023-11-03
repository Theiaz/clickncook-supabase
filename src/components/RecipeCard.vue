<script setup lang="ts">
import type { Recipe } from '@/types/recipe'
import ImageCarousel from './ImageCarousel.vue'
import RecipeHeader from './recipes/RecipeHeader.vue'

const props = defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <article>
    <header>
      <ImageCarousel :images="recipe!.images" />
      <RecipeHeader class="mt-4" :recipe="recipe" />
    </header>
    <p>{{ props.recipe.description }}</p>
  </article>
</template>
