<script setup lang="ts">
import { findRecipeById } from '@/api/recipes/api'
import RecipeDetails from '@/components/recipes/RecipeDetails.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { useMyRecipesStore } from '@/stores/myRecipes'
import { storeToRefs } from 'pinia'
import { onBeforeMount, ref } from 'vue'

const props = defineProps<{
  id: string
}>()

const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)
const myRecipes = useMyRecipesStore()

const loading = ref<boolean>(false)
const loadRecipeFromStore = () => {
  loading.value = true
  const myRecipe = myRecipes.getRecipeById(props.id)
  if (myRecipe) {
    recipe.value = myRecipe
  }
  loading.value = false
}
const fetchRecipe = async () => {
  loading.value = true
  try {
    recipe.value = await findRecipeById(props.id)
  } catch (error: any) {
    alert(error.message)
  }
  loading.value = false
}

onBeforeMount(async () => {
  if (recipe.value.id !== props.id) {
    loadRecipeFromStore()
  }
  if (recipe.value.id === '') {
    fetchRecipe()
  }
})
</script>
<template>
  <template v-if="recipe">
    <RecipeDetails :recipe="recipe" />
  </template>
  <p v-else>Something went wrong! Please try to reload this page.</p>
</template>
