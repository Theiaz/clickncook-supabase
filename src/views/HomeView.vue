<script setup lang="ts">
import RecipeCard from '@/components/RecipeCard.vue'
import { useRecipeStore } from '@/stores/recipe'
import { storeToRefs } from 'pinia'
import { onBeforeMount } from 'vue'

const recipeStore = useRecipeStore()
const { recipe } = storeToRefs(recipeStore)

onBeforeMount(async () => {
  await recipeStore.getRandomRecipe()
})
</script>
<template>
  <button v-if="recipe" @click="recipeStore.getRandomRecipe">Get a new recipe</button>
  <router-link :to="{ name: 'newRecipe' }">Create new recipe</router-link>
  <RecipeCard v-if="recipe" :recipe="recipe" :is-readonly="true" />
  <p v-else>There are no recipes. Start creating one!</p>
</template>
