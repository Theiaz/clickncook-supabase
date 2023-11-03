<script setup lang="ts">
import type { Recipe } from '@/types/recipe'

defineProps<{
  recipe: Recipe
}>()
</script>
<template>
  <h2 class="text-primary font-bold">{{ recipe.name }}</h2>
</template>
