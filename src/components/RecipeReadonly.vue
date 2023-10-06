<script setup lang="ts">
import type { Recipe } from '@/types/recipe'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <h2>{{ recipe.name }}</h2>
  <img v-if="recipe.imgUrl" :src="recipe.imgUrl" :alt="recipe.name!" />
  <div>{{ recipe.description }}</div>
</template>
