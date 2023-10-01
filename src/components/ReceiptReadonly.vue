<script setup lang="ts">
import type { Receipt } from '@/types/receipt'

defineProps<{
  receipt: Receipt
}>()
</script>
<template>
  <h2>{{ receipt.name }}</h2>
  <img v-if="receipt.imgUrl" :src="receipt.imgUrl" :alt="receipt.name!" />
  <div>{{ receipt.description }}</div>
</template>
