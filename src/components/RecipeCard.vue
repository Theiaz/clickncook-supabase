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
      <h2>{{ props.recipe.name }}</h2>
      <router-link :to="{ name: 'details', params: { id: recipe.id } }"> Show details </router-link>
      <ImageCarousel :images="recipe!.images" />
    </header>
    <p>{{ props.recipe.description }}</p>
  </article>
</template>
