<script setup lang="ts">
import ImageCarousel from '@/components/images/ImageCarousel.vue'
import type { Recipe } from '@/types/recipe'
import RecipeGrid from '../RecipeGrid.vue'
import RecipeHeader from './RecipeHeader.vue'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <RecipeGrid>
    <template #left>
      <ImageCarousel class="full-width" :images="recipe!.images" />
      <RecipeHeader :recipe="recipe" />
    </template>
    <template #right>
      <p v-if="recipe.description" class="whitespace-pre-wrap break-all">
        {{ recipe.description }}
      </p>
      <p v-else>No description.</p>
    </template>
  </RecipeGrid>
</template>
<style scoped>
.recipe-container {
  container-name: recipe;
  container-type: inline-size;
}
.full-width {
  @apply relative left-1/2 right-1/2 w-screen max-w-[100vw] -mx-[50vw];
}

@container recipe (width > 700px) {
  .full-width {
    @apply static w-full mx-0;
  }
}
</style>
