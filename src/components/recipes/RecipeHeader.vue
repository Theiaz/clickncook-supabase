<script setup lang="ts">
import RecipeActions from '@/components/actions/RecipeActions.vue'
import RecipeCategories from '@/components/categories/RecipeCategories.vue'
import RecipeRating from '@/components/rating/RecipeRating.vue'
import { useUser } from '@/composables/useUser'
import type { Recipe } from '@/types/recipe'
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import CookingTime from './CookingTime.vue'

const props = defineProps<{
  recipe: Recipe
}>()

const { user } = useUser()
const isOwnRecipe = computed(() => props.recipe.authorId === user.value?.id)
const route = useRoute()
const isHomeScreen = computed(() => route.name === 'home')
const shouldDisplayActions = computed(() => isOwnRecipe.value && !isHomeScreen.value)
</script>
<template>
  <div class="flex justify-between text-primary items-center h-10">
    <h3 class="font-bold">{{ recipe.name }}</h3>
    <RecipeActions v-if="shouldDisplayActions" :recipe="recipe" />
  </div>
  <div class="flex items-center justify-between gap-4">
    <RecipeRating :model-value="recipe.rating" />
    <CookingTime :model-value="recipe.cookingTime" />
  </div>
  <RecipeCategories />
</template>
