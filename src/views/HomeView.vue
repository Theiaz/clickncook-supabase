<script setup lang="ts">
import { findRandomRecipe } from '@/api/recipes/api'
import RecipeCard from '@/components/RecipeCard.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'

const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)
const loading = ref(false)

const hasRecipe = computed(() => recipe.value.id !== '')
onBeforeMount(async () => {
  if (hasRecipe.value) {
    return
  }

  await getRandomRecipe()
})

const getRandomRecipe = async () => {
  try {
    loading.value = true
    const data = await findRandomRecipe()
    if (!data) {
      return
    }
    loading.value = false
    recipe.value = data
  } catch (error: any) {
    alert(error.message)
  }
}
</script>
<template>
  <button v-if="hasRecipe" @click="getRandomRecipe" :aria-busy="loading"> Get a new recipe </button>
  <router-link :to="{ name: 'newRecipe' }">Create new recipe</router-link>
  <RecipeCard v-if="hasRecipe" :recipe="recipe" />
  <p v-else>There are no recipes. Start creating one!</p>
</template>
