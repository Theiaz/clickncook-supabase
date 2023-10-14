<script setup lang="ts">
import RecipeCard from '@/components/RecipeCard.vue'
import { useRecipeStore } from '@/stores/recipe'
import { storeToRefs } from 'pinia'
import { onBeforeMount } from 'vue'

const recipeStore = useRecipeStore()
const { recipes } = storeToRefs(recipeStore)

onBeforeMount(() => {
  recipeStore.getMyRecipes()
})
</script>
<template>
  <template v-for="recipe in recipes" :key="recipe.id">
    <RecipeCard :recipe="recipe" />
  </template>
  <p v-if="recipes.length === 0">There are no recipes. Start creating one!</p>
</template>
