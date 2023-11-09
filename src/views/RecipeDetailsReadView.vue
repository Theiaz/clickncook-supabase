<script setup lang="ts">
import RecipeDetails from '@/components/recipes/RecipeDetails.vue'
import type { Recipe } from '@/types/recipe'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <template v-if="recipe">
    <RecipeDetails :recipe="recipe" />
  </template>
  <p v-else>Something went wrong! Please try to reload this page.</p>
</template>
