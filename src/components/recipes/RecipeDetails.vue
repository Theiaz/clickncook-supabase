<script setup lang="ts">
import ImageCarousel from '@/components/images/ImageCarousel.vue'
import type { Recipe } from '@/types/recipe'
import RecipeHeader from './RecipeHeader.vue'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <div class="recipe-container">
    <div class="recipe">
      <ImageCarousel class="full-width" :images="recipe!.images" />
      <section class="flex flex-col gap-4">
        <RecipeHeader :recipe="recipe" />
        <div>{{ recipe.description }}</div>
      </section>
    </div>
  </div>
</template>
<style scoped>
.recipe-container {
  container-name: recipe;
  container-type: inline-size;
}

.full-width {
  @apply relative left-1/2 right-1/2 w-screen max-w-[100vw] -mx-[50vw];
}

.recipe {
  @apply grid gap-4;
}

@container recipe (width > 700px) {
  .recipe {
    @apply grid-cols-2 gap-8 max-w-[120ch] place-content-center mx-auto;
  }

  .full-width {
    @apply static w-full mx-0;
  }
}
</style>
