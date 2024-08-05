<script setup lang="ts">
import CardSkeleton from '@/components/cards/CardSkeleton.vue'
import RecipeCard from '@/components/cards/RecipeCard.vue'
import BaseLayout from '@/layouts/BaseLayout.vue'
import { useMyRecipesStore } from '@/stores/myRecipes'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'

const recipeStore = useMyRecipesStore()
const { recipes } = storeToRefs(recipeStore)
const isLoading = ref<boolean>(true)
const noRecipes = computed(() => recipes.value.length === 0 && isLoading.value === false)

onBeforeMount(async () => {
  await recipeStore.getMyRecipes()
  isLoading.value = false
})
</script>
<template>
  <BaseLayout>
    <h2 class="mb-4 text-primary">Your recipes</h2>
    <ul class="auto-grid">
      <li v-for="recipe in recipes" :key="recipe.id">
        <RecipeCard :recipe="recipe" />
      </li>
      <template v-if="isLoading">
        <li v-for="i in 8" :key="i">
          <CardSkeleton />
        </li>
      </template>
    </ul>
    <p v-if="noRecipes">There are no recipes. Start creating one!</p>
  </BaseLayout>
</template>
<style scoped>
.auto-grid {
  --min-col-size: 20rem;
  @apply grid gap-4;
  grid-template-columns: repeat(auto-fill, minmax(min(var(--min-col-size), 100%), 1fr));
}
</style>
