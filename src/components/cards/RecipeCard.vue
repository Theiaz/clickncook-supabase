<script setup lang="ts">
import BaseCard from '@/components/cards/BaseCard.vue'
import ImageCarousel from '@/components/images/ImageCarousel.vue'
import RecipeHeader from '@/components/recipes/RecipeHeader.vue'
import type { Recipe } from '@/types/recipe'

const props = defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <BaseCard>
    <template #header>
      <ImageCarousel :images="recipe!.images" />
    </template>
    <template #content>
      <div class="flex flex-col gap-4">
        <RecipeHeader :recipe="recipe" />
        <p class="whitespace-pre-wrap break-all max-h-16 truncate">{{ props.recipe.description }}</p>
      </div>
    </template>
  </BaseCard>
</template>
