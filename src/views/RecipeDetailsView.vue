<script setup lang="ts">
import { findRecipeById } from '@/api/recipes/api'
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
  if (!recipe.value.id) {
    await fetchRecipe()
  }

  if (recipe.value.id && recipe.value.id !== props.id) {
    loadRecipeFromStore()
  }
})
</script>
<template>
  <router-view :recipe="recipe"></router-view>
</template>
