<script setup lang="ts">
import ReceiptCard from '@/components/ReceiptCard.vue'
import { useUser } from '@/composables/useUser'
import { supabase } from '@/supabase'
import { mapToDomain, type Receipt } from '@/types/receipt'
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

    receipts.value = await Promise.all(data.map(async (el) => mapToDomain(el)))
  } catch (error) {
    alert(error)
  }
}
</script>
<template>
  <template v-for="receipt in receipts" :key="receipt.id">
    <ReceiptCard :receipt="receipt" />
  </template>
</template>
