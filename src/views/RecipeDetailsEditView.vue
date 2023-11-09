<script setup lang="ts">
import RecipeEdit from '@/components/RecipeEdit.vue'
import type { Recipe } from '@/types/recipe'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <template v-if="recipe">
    <RecipeEdit :recipe="recipe!" />
  </template>
  <p v-else>Something went wrong! Please try to reload this page.</p>
</template>
