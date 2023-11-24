<script setup lang="ts">
import ImageCarousel from '@/components/images/ImageCarousel.vue'
import RecipeRating from '@/components/rating/RecipeRating.vue'
import type { Recipe } from '@/types/recipe'
import RecipeHeader from './RecipeHeader.vue'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <ImageCarousel class="full-width" :images="recipe!.images" />
  <section class="mt-4 flex flex-col gap-4">
    <RecipeHeader :recipe="recipe" />
    <RecipeRating :model-value="recipe.rating" />
    <div>{{ recipe.description }}</div>
  </section>
</template>
<style scoped>
.full-width {
  @apply relative left-1/2 right-1/2 w-screen max-w-[100vw] -mx-[50vw];
}
</style>
