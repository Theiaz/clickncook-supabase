<script setup lang="ts">
import { findRandomRecipe } from '@/api/recipes/api'
import RecipeCard from '@/components/RecipeCard.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount } from 'vue'

const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)

const hasRecipe = computed(() => recipe.value.id !== '')
onBeforeMount(async () => {
  if (hasRecipe.value) {
    return
  }
  await getRandomRecipe()
})

const getRandomRecipe = async () => {
  try {
    const data = await findRandomRecipe()
    if (!data) {
      return
    }
    recipe.value = data
  } catch (error: any) {
    alert(error.message)
  }
}
</script>
<template>
  <button v-if="hasRecipe" @click="getRandomRecipe">Get a new recipe</button>
  <router-link :to="{ name: 'newRecipe' }">Create new recipe</router-link>
  <RecipeCard v-if="hasRecipe" :recipe="recipe" />
  <p v-else>There are no recipes. Start creating one!</p>
</template>
