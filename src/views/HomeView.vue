<script setup lang="ts">
import { findRandomRecipe } from '@/api/recipes/api'
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import RecipeDetails from '@/components/recipes/RecipeDetails.vue'
import StickyBottomLayout from '@/layouts/StickyBottomLayout.vue'
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
  <StickyBottomLayout>
    <template #content>
      <template v-if="hasRecipe">
        <RecipeDetails :recipe="recipe" />
      </template>
      <p v-else>There are no recipes. Start creating one!</p>
    </template>
    <template #actions v-if="hasRecipe">
      <router-link
        :to="{ name: 'details', params: { id: recipe.id } }"
        class="rounded-full px-4 py-2 text-white bg-secondary"
        >Show Details
      </router-link>
      <PrimaryButton @click="getRandomRecipe">New Recipe</PrimaryButton>
    </template>
  </StickyBottomLayout>
</template>
