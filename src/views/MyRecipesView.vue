<script setup lang="ts">
import RecipeCard from '@/components/cards/RecipeCard.vue'
import { useMyRecipesStore } from '@/stores/myRecipes'
import { storeToRefs } from 'pinia'
import { onBeforeMount } from 'vue'

const recipeStore = useMyRecipesStore()
const { recipes } = storeToRefs(recipeStore)

onBeforeMount(async () => {
  await recipeStore.getMyRecipes()
})
</script>
<template>
  <ul class="auto-grid">
    <li v-for="recipe in recipes" :key="recipe.id">
      <RecipeCard :recipe="recipe" />
    </li>
  </ul>
  <p v-if="recipes.length === 0">There are no recipes. Start creating one!</p>
</template>
<style scoped>
.auto-grid {
  --min-col-size: 20rem;
  @apply grid gap-4;
  grid-template-columns: repeat(auto-fill, minmax(min(var(--min-col-size), 100%), 1fr));
}
</style>
