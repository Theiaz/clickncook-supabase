<script setup lang="ts">
import { useUser } from '@/composables/useUser'
import { useRecipeStore } from '@/stores/recipe'
import type { Recipe } from '@/types/recipe'
import { computed } from 'vue'

const props = defineProps<{
  recipe: Recipe
}>()

const hasImg = computed(() => props.recipe.imgUrl !== null)

const { user } = useUser()
const isOwnRecipe = computed(() => props.recipe.authorId === user.value?.id)

const recipeStore = useRecipeStore()
</script>
<template>
  <article>
    <header>
      <h2>{{ props.recipe.name }}</h2>
      <router-link :to="{ name: 'details', params: { id: recipe.id } }"> Show details </router-link>
      <button v-if="isOwnRecipe" @click="recipeStore.deleteRecipe(props.recipe)">Delete</button>
      <img v-if="hasImg" :src="props.recipe.imgUrl" />
    </header>
    <p>{{ props.recipe.description }}</p>
  </article>
</template>
