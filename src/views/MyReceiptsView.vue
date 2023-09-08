<script setup lang="ts">
import ReceiptCard from '@/components/ReceiptCard.vue'
import { useUser } from '@/composables/useUser'
import { supabase } from '@/supabase'
import type { Receipt } from '@/types/receipt'
import { onMounted, ref } from 'vue'

const receipts = ref<Receipt[]>([])
const { user } = useUser()

onMounted(() => {
  getReceipts(user.value!.id)
})

const getReceipts = async (authorId: string) => {
  try {
    const { data, error } = await supabase.from('receipts').select().eq('author_id', authorId)

    if (error) throw error

    receipts.value = await Promise.all(
      data.map(async (el) => ({
        id: el.id,
        name: el.name,
        description: el.description,
        authorId: el.author_id!,
        imgUrl: el.name ? await getReceiptImage(el.img_name) : null
      }))
    )
  } catch (error) {
    alert(error)
  }
}

// TODO schaefer - duplicated in home view
const getReceiptImage = async (name: string | null) => {
  if (name === null) {
    return null
  }

  const { data } = await supabase.storage.from('receipt_images').getPublicUrl(name!)

  return data.publicUrl
}
</script>
<template>
  <template v-for="receipt in receipts" :key="receipt.id">
    <ReceiptCard :receipt="receipt" />
  </template>
</template>
