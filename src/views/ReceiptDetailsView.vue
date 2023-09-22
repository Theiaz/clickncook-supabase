<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps<{
  id: string
}>()

const loading = ref<boolean>(false)
const router = useRouter()
const receiptStore = useReceiptStore()
const { receipt } = storeToRefs(receiptStore)

onBeforeMount(async () => {
  if (receipt.value.id === '' || receipt.value.id !== props.id) {
    loading.value = true
    await receiptStore.getReceiptById(props.id)
    loading.value = false
  }
})

const onSubmit = async () => {
  await receiptStore.updateReceipt(receipt.value)
  await router.push({ name: 'home' })
}
const loadingText = computed(() => (loading.value ? 'Loading ...' : 'Edit Receipt'))
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
    <ImageUpload v-model="receipt.imgUrl" />
    <div>
      <button type="submit" :aria-busy="loading">{{ loadingText }}</button>
    </div>
  </form>
</template>
