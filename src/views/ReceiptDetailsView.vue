<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useReceiptStore } from '@/stores/receipt'
import { supabase } from '@/supabase'
import { mapToDAO, type ReceiptDAO } from '@/types/receipt'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps<{
  id: string
}>()

const loading = ref<boolean>(false)
const router = useRouter()
const { receipt } = storeToRefs(useReceiptStore())

onBeforeMount(async () => {
  if (receipt.value.id === '' || receipt.value.id !== props.id)
    try {
      loading.value = true
      let { data, error } = await supabase.from('receipts').select('*').eq('id', props.id).single()

      if (error) throw error

      if (data) {
        receipt.value = {
          id: data.id,
          name: data.name,
          description: data.description,
          authorId: data.author_id!,
          imgUrl: data.img_name
        }
      }
    } catch (error: any) {
      alert(error.message)
    } finally {
      loading.value = false
    }
})

const updateReceipt = async () => {
  try {
    loading.value = true

    const receiptDao: ReceiptDAO = mapToDAO(receipt.value)

    let { error } = await supabase.from('receipts').update(receiptDao).eq('id', receiptDao.id)

    if (error) throw error

    await router.push({ name: 'home' })
  } catch (error: any) {
    alert(error.message)
    loading.value = false
  }
}

const loadingText = computed(() => (loading.value ? 'Loading ...' : 'Edit Receipt'))
</script>
<template>
  <form @submit.prevent="updateReceipt">
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
