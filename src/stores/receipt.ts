import { useUser } from '@/composables/useUser'
import { supabase } from '@/supabase'
import { mapToDAO, mapToDomain, type Receipt, type ReceiptDAO } from '@/types/receipt'
import { defineStore } from 'pinia'
import { ref, type Ref } from 'vue'

export const useReceiptStore = defineStore('receipt', () => {
  // user receipts
  const receipts: Ref<Receipt[]> = ref([])
  const { user } = useUser()
  const getReceiptsForCurrentUser = async () => {
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

  // current receipt
  const receipt: Ref<Receipt> = ref({
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

  const createReceipt = async (receipt: Omit<Receipt, 'id' | 'imgUrl' | 'authorId'>) => {
    try {
      // TODO schaefer - use mapToDAO?
      const receiptDAO: Omit<ReceiptDAO, 'id' | 'created_at'> = {
        name: receipt.name,
        description: receipt.description!,
        author_id: user.value!.id,
        img_name: receipt.imgName!
      }

      const { error } = await supabase.from('receipts').insert(receiptDAO)

      if (error) throw error

      // TODO schaefer - temporary reload to catch newly created one, use local state later
      await getReceiptsForCurrentUser()
    } catch (error: any) {
      alert(error.message)
    }
  }

  const updateReceipt = async (receipt: Receipt) => {
    try {
      const receiptDao: ReceiptDAO = mapToDAO(receipt)

      const { error } = await supabase.from('receipts').update(receiptDao).eq('id', receiptDao.id)

      if (error) throw error
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
    createReceipt,
    updateReceipt,
    deleteReceipt
  }
})
