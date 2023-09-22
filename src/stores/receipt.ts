import { useUser } from '@/composables/useUser'
import { supabase } from '@/supabase'
import { mapToDomain, type Receipt } from '@/types/receipt'
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useReceiptStore = defineStore('receipt', () => {
  const receipts = ref<Receipt[]>([])
  const getReceiptsForCurrentUser = async () => {
    const { user } = useUser()
    if (user.value) {
      try {
        const { data, error } = await supabase
          .from('receipts')
          .select()
          .eq('author_id', user.value?.id)

        if (error) throw error

        receipts.value = await Promise.all(data.map(async (el) => mapToDomain(el)))
      } catch (error) {
        alert(error)
      }
    }
  }

  getReceiptsForCurrentUser()

  const receipt = ref<Receipt>({
    id: '',
    name: '',
    description: '',
    imgUrl: '',
    imgName: '',
    authorId: ''
  })
  const getReceiptById = async (id: string) => {
    try {
      const { data, error } = await supabase.from('receipts').select('*').eq('id', id).maybeSingle()

      if (error) throw error

      if (data) {
        receipt.value = await mapToDomain(data)
      }
    } catch (error: any) {
      alert(error.message)
    }
  }

  const getRandomReceipt = async () => {
    try {
      const { data, error } = await supabase.rpc('get_random_receipt').maybeSingle()

      if (error) throw error

      if (data) {
        receipt.value = await mapToDomain(data)
      }
    } catch (error: any) {
      alert(error.message)
    }
  }

  const deleteReceipt = async (receipt: Receipt) => {
    try {
      const { error: errorReceipt } = await supabase.from('receipts').delete().eq('id', receipt.id)
      if (errorReceipt) throw errorReceipt

      const { error: errorImg } = await supabase.storage
        .from('receipt_images')
        .remove([receipt.imgName!])
      if (errorImg) throw errorImg

      receipts.value = receipts.value.filter((el) => el.id !== receipt.id)
    } catch (error: any) {
      alert(error.message)
    }
  }

  return {
    receipts,
    getReceiptsForCurrentUser,
    receipt,
    getReceiptById,
    getRandomReceipt,
    deleteReceipt
  }
})
