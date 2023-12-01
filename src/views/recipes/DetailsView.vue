<script setup lang="ts">
import RecipeDetails from '@/components/recipes/RecipeDetails.vue'
import BaseLayout from '@/layouts/BaseLayout.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { onBeforeMount } from 'vue'

const props = defineProps<{
  id: string
}>()

const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)

onBeforeMount(async () => {
  if (!recipe.value.id || recipe.value.id !== props.id) {
    await recipeStore.fetchRecipe(props.id)
  }
})
</script>
<template>
  <BaseLayout>
    <template v-if="recipe">
      <RecipeDetails :recipe="recipe" />
    </template>
    <p v-else>Something went wrong! Please try to reload this page.</p>
  </BaseLayout>
</template>
