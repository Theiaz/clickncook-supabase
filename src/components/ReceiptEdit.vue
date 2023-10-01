<script setup lang="ts">
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { useRouter } from 'vue-router'
import ImageUpload from './ImageUpload.vue'

const router = useRouter()
const receiptStore = useReceiptStore()
const { receipt } = storeToRefs(receiptStore)

const onSubmit = async () => {
  if (receipt.value) {
    await receiptStore.updateReceipt(receipt.value)
    await router.push({ name: 'home' })
  }
}
</script>
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="receipt!.name" />
    </div>
    <ImageUpload v-model="receipt!.imgName" />
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="receipt!.description" />
    </div>
    <div>
      <button type="submit">Edit receipt</button>
    </div>
  </form>
</template>
