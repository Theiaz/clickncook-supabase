<script setup lang="ts">
import ReceiptCard from '@/components/ReceiptCard.vue'
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { onMounted, ref } from 'vue'
import { supabase } from '../supabase'

const loading = ref<boolean>(false)
const { receipt } = storeToRefs(useReceiptStore())

onMounted(async () => {
  await getRandomReceipt()
})

const getRandomReceipt = async () => {
  try {
    loading.value = true

    let { data, error } = await supabase.rpc('get_random_receipt').maybeSingle()

    if (error) throw error

    if (data) {
      receipt.value = {
        id: data.id,
        name: data.name,
        description: data.description,
        authorId: data.author_id!
      }

      getReceiptImage(data.img_name)
    }
  } catch (error: any) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

const getReceiptImage = async (name: string | null) => {
  if (name === null) {
    receipt.value.imgUrl = null
    return
  }

  const { data } = supabase.storage.from('receipt_images').getPublicUrl(name!)

  receipt.value.imgUrl = data.publicUrl
}
</script>
<template>
  <template v-if="receipt.id">
    <ReceiptCard :receipt="receipt" />
    <button @click="getRandomReceipt">Get a new receipt</button>
  </template>
  <p v-else>There are no receipts. Start creating one!</p>
  <router-link :to="{ name: 'newReceipt' }">Create new receipt</router-link>
</template>
