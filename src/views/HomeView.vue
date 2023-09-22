<script setup lang="ts">
import ReceiptCard from '@/components/ReceiptCard.vue'
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { onBeforeMount } from 'vue'

const receiptStore = useReceiptStore()
const { receipt } = storeToRefs(receiptStore)

onBeforeMount(async () => {
  await receiptStore.getRandomReceipt()
})
</script>
<template>
  <button v-if="receipt.id" @click="receiptStore.getRandomReceipt">Get a new receipt</button>
  <router-link :to="{ name: 'newReceipt' }">Create new receipt</router-link>
  <ReceiptCard v-if="receipt.id" :receipt="receipt" />
  <p v-else>There are no receipts. Start creating one!</p>
</template>
