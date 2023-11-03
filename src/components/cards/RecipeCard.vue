<script setup lang="ts">
import ImageCarousel from '@/components/ImageCarousel.vue'
import BaseCard from '@/components/cards/BaseCard.vue'
import RecipeHeader from '@/components/recipes/RecipeHeader.vue'
import type { Recipe } from '@/types/recipe'
import EyeIcon from '../icons/EyeIcon.vue'

const props = defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <BaseCard>
    <template #header>
      <ImageCarousel :images="recipe!.images">
        <template #actions>
          <router-link :to="{ name: 'details', params: { id: recipe.id } }">
            <EyeIcon />
          </router-link>
        </template>
      </ImageCarousel>
    </template>
    <template #content>
      <RecipeHeader :recipe="recipe" />
      <p>{{ props.recipe.description }}</p>
    </template>
  </BaseCard>
</template>
