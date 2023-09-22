import { supabase } from '@/supabase'
import { mapToDomain, type Receipt } from '@/types/receipt'
import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useReceiptStore = defineStore('receipt', () => {
  const receipt = ref<Receipt>({
    id: '',
    name: '',
    description: '',
    imgUrl: '',
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

  return { receipt, getReceiptById, getRandomReceipt }
})
