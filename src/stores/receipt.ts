import {
  deleteReceipt as apiDeleteReceipt,
  updateReceipt as apiUpdateReceipt,
  createReceiptForUser,
  findRandomReceipt,
  findReceiptById,
  findReceiptsByAuthorId
} from '@/api/receipts/api'
import { useUser } from '@/composables/useUser'
import type { Receipt } from '@/types/receipt'
import { acceptHMRUpdate, defineStore } from 'pinia'
import { ref, type Ref } from 'vue'

export const useReceiptStore = defineStore('receipt', () => {
  // user receipts
  const receipts: Ref<Receipt[]> = ref([])
  const { user } = useUser()
  const getMyReceipts = async () => {
    if (user.value) {
      try {
        receipts.value = await findReceiptsByAuthorId(user.value?.id)
      } catch (error) {
        alert(error)
      }
    }
  }
  getMyReceipts()

  // current receipt
  const receipt: Ref<Receipt | null> = ref(null)
  const getReceiptById = async (id: string) => {
    try {
      receipt.value = await findReceiptById(id)
    } catch (error: any) {
      alert(error.message)
    }
  }

  const getRandomReceipt = async () => {
    try {
      receipt.value = await findRandomReceipt()
    } catch (error: any) {
      alert(error.message)
    }
  }

  const createReceipt = async (receipt: Omit<Receipt, 'id' | 'imgUrl' | 'authorId'>) => {
    try {
      if (user.value) {
        await createReceiptForUser(receipt, user.value.id)
      }
    } catch (error: any) {
      alert(error.message)
    }
  }

  const updateReceipt = async (receipt: Receipt) => {
    try {
      await apiUpdateReceipt(receipt)
    } catch (error: any) {
      alert(error.message)
    }
  }

  const deleteReceipt = async (receipt: Receipt) => {
    try {
      await apiDeleteReceipt(receipt)

      receipts.value = receipts.value.filter((el) => el.id !== receipt.id)
    } catch (error: any) {
      alert(error.message)
    }
  }

  return {
    receipts,
    getMyReceipts,
    receipt,
    getReceiptById,
    getRandomReceipt,
    createReceipt,
    updateReceipt,
    deleteReceipt
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useReceiptStore, import.meta.hot))
}
