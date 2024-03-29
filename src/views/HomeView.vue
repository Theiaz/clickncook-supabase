<script setup lang="ts">
import { findRandomRecipe } from '@/api/recipes/api'
import RecipeReadonly from '@/components/recipes/RecipeReadonly.vue'
import Button from '@/components/ui/button/Button.vue'
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
      <RecipeReadonly v-if="hasRecipe" :recipe="recipe" />
      <p v-else>There are no recipes. Start creating one!</p>
    </template>
    <template #actions v-if="hasRecipe">
      <router-link :to="{ name: 'details', params: { id: recipe.id } }" v-slot="{ href, navigate }">
        <Button variant="secondary" :href="href" @click="navigate">Show Details</Button>
      </router-link>
      <Button @click="getRandomRecipe" data-test="next-button">Next Recipe</Button>
    </template>
  </StickyBottomLayout>
</template>
