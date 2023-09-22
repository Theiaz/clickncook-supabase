<script setup lang="ts">
import { useUser } from '@/composables/useUser'
import type { Receipt } from '@/types/receipt'
import { computed } from 'vue'

const props = defineProps<{
  receipt: Receipt
}>()

const hasImg = computed(() => props.receipt.imgUrl !== null)

const { user } = useUser()
const isEditable = computed(() => props.receipt.authorId === user.value?.id)
</script>
<template>
  <article>
    <header>
      <h2>{{ props.receipt.name }}</h2>
      <router-link v-if="isEditable" :to="{ name: 'details', params: { id: receipt.id } }">
        Edit
      </router-link>
      <img v-if="hasImg" :src="props.receipt.imgUrl!" />
    </header>
    <p>{{ props.receipt.description }}</p>
  </article>
</template>
