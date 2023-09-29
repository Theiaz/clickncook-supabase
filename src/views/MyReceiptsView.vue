<script setup lang="ts">
import ReceiptCard from '@/components/ReceiptCard.vue'
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { onMounted } from 'vue'

const receiptStore = useReceiptStore()
const { receipts } = storeToRefs(receiptStore)

onMounted(() => {
  receiptStore.getMyReceipts()
})
</script>
<template>
  <template v-for="receipt in receipts" :key="receipt.id">
    <ReceiptCard :receipt="receipt" />
  </template>
</template>
