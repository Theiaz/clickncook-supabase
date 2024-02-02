<script setup lang="ts">
import { Badge } from '@/components/ui/badge'
import type { Category } from '@/types/category'

const props = defineProps<{
  categories: Category[]
}>()
</script>
<template>
  <div class="flex gap-4 overflow-x-scroll snap-x snap-mandatory no-scrollbar">
    <Badge v-for="category in props.categories" :key="category.id" class="snap-center">
      {{ category.name }}
    </Badge>
  </div>
</template>
<style scoped>
/* Hide scrollbar for Chrome, Safari, and Opera */
.no-scrollbar::-webkit-scrollbar {
  display: none;
}

/* Hide scrollbar for IE, Edge, and Firefox */
.no-scrollbar {
  -ms-overflow-style: none; /* IE and Edge */
  scrollbar-width: none; /* Firefox */
}
</style>
