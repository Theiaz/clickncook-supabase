<script setup lang="ts">
import { useUser } from '@/composables/useUser'
import router from '@/router'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import type { Recipe } from '@/types/recipe'
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import EditIcon from '../icons/EditIcon.vue'
import TrashIcon from '../icons/TrashIcon.vue'

const props = defineProps<{
  recipe: Recipe
}>()

const recipeStore = useCurrentRecipeStore()

const { user } = useUser()
const isOwnRecipe = computed(() => props.recipe.authorId === user.value?.id)
const route = useRoute()
const isHomeScreen = computed(() => route.name === 'home')
const shouldDisplayActions = computed(() => isOwnRecipe.value && !isHomeScreen.value)

const onDelete = async () => {
  if (props.recipe) {
    await recipeStore.deleteRecipe(props.recipe)
    await router.push({ name: 'home' })
  }
}
</script>
<template>
  <div class="flex justify-between  text-primary">
    <h2 class="font-bold">{{ recipe.name }}</h2>
    <div v-if="shouldDisplayActions" class="flex gap-4">
      <router-link :to="{ name: 'edit', params: { id: recipe.id } }">
        <EditIcon />
      </router-link>
      <button @click="onDelete">
        <TrashIcon />
      </button>
    </div>
  </div>
</template>
