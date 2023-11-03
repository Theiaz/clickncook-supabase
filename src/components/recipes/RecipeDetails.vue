<script setup lang="ts">
import { useUser } from '@/composables/useUser'
import router from '@/router'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import type { Recipe } from '@/types/recipe'
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import ImageCarousel from '../ImageCarousel.vue'
import EditIcon from '../icons/EditIcon.vue'
import TrashIcon from '../icons/TrashIcon.vue'
import RecipeHeader from './RecipeHeader.vue'

const props = defineProps<{
  recipe: Recipe
}>()
const recipeStore = useCurrentRecipeStore()

const { user } = useUser()
const isOwnRecipe = computed(() => props.recipe.authorId === user.value?.id)
const route = useRoute()
const isHomeScreen = computed(() => route.name === 'home')

const onDelete = async () => {
  if (props.recipe) {
    await recipeStore.deleteRecipe(props.recipe)
    await router.push({ name: 'home' })
  }
}
</script>
<template>
  <ImageCarousel class="full-width" :images="recipe!.images">
    <template #actions v-if="isOwnRecipe && !isHomeScreen">
      <router-link :to="{ name: 'edit', params: { id: recipe.id } }">
        <EditIcon />
      </router-link>
      <button @click="onDelete">
        <TrashIcon />
      </button>
    </template>
  </ImageCarousel>
  <section class="mt-2 flex flex-col gap-4">
    <RecipeHeader :recipe="recipe" />
    <div>{{ recipe.description }}</div>
  </section>
</template>
<style scoped>
.full-width {
  @apply relative left-1/2 right-1/2 w-screen max-w-[100vw] -mx-[50vw];
}
</style>
