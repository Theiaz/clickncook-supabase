<script setup lang="ts">
import ImageCarousel from '@/components/ImageCarousel.vue'
import BaseCard from '@/components/cards/BaseCard.vue'
import RecipeHeader from '@/components/recipes/RecipeHeader.vue'
import type { Recipe } from '@/types/recipe'

const props = defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <BaseCard>
    <template #header>
      <ImageCarousel :images="recipe!.images" />
    </template>
    <template #content>
      <RecipeHeader :recipe="recipe" />
      <p>{{ props.recipe.description }}</p>
    </template>
  </BaseCard>
</template>
