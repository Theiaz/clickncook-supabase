<script setup lang="ts">
import type { Receipt } from '@/types/receipt'
import { computed } from 'vue'

const props = defineProps<{
  receipt: Receipt
}>()

const hasImg = computed(() => props.receipt.imgUrl !== null)
</script>
<template>
  <article>
    <header>
      <h2>{{ props.receipt.name }}</h2>
      <img v-if="hasImg" :src="props.receipt.imgUrl!" />
    </header>
    <p>{{ props.receipt.description }}</p>
  </article>
</template>
