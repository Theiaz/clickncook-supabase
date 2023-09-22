<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useReceiptStore } from '@/stores/receipt'
import type { Receipt } from '@/types/receipt'
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'

const loading = ref<boolean>(false)
const receipt = ref<Omit<Receipt, 'id' | 'imgUrl' | 'authorId'>>({
  name: '',
  description: '',
  imgName: ''
})

const receiptStore = useReceiptStore()
const router = useRouter()

const onSubmit = async () => {
  receiptStore.createReceipt(receipt.value)
  await router.push({ name: 'home' })
}

const loadingText = computed(() => (loading.value ? 'Loading ...' : 'Create Receipt'))
</script>
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="receipt.name" />
    </div>
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="receipt.description" />
    </div>
    <ImageUpload v-model="receipt.imgName" />
    <div>
      <button type="submit" :aria-busy="loading">{{ loadingText }}</button>
    </div>
  </form>
</template>
