<script setup lang="ts">
import { useUser } from '@/composables/useUser'
import { useReceiptStore } from '@/stores/receipt'
import type { Receipt } from '@/types/receipt'
import { computed } from 'vue'

export interface Props {
  receipt: Receipt
  isReadonly: boolean
}
const props = withDefaults(defineProps<Props>(), {
  isReadonly: false
})

const hasImg = computed(() => props.receipt.imgUrl !== null)

const { user } = useUser()
const isOwnReceipt = computed(() => props.receipt.authorId === user.value?.id)

const receiptStore = useReceiptStore()
</script>
<template>
  <article>
    <header>
      <h2>{{ props.receipt.name }}</h2>

      <router-link v-if="isOwnReceipt" :to="{ name: 'details', params: { id: receipt.id } }"
        >{{ isReadonly ? 'Show' : 'Edit' }}
      </router-link>
      <button v-if="isOwnReceipt && !isReadonly" @click="receiptStore.deleteReceipt(props.receipt)">
        Delete
      </button>

      <img v-if="hasImg" :src="props.receipt.imgUrl" />
    </header>
    <p>{{ props.receipt.description }}</p>
  </article>
</template>
