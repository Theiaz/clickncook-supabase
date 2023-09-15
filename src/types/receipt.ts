import { supabase } from '@/supabase'
import type { Database } from '../schema'
import type { Author } from './author'

interface Receipt {
  id: string
  name: string | null
  description?: string | null
  imgUrl?: string | null
  authorId: Author['id']
}

type ReceiptDAO = Database['public']['Tables']['receipts']['Row']

const mapToDomain = async (data: ReceiptDAO): Promise<Receipt> => {
  return {
    id: data.id,
    name: data.name,
    description: data.description,
    authorId: data.author_id!,
    imgUrl: await mapImageNameToURL(data.img_name)
  }
}

const mapImageNameToURL = async (name: string | null) => {
  if (name === null) {
    return null
  }

  const { data } = supabase.storage.from('receipt_images').getPublicUrl(name!)

  return data.publicUrl
}

export { mapToDomain, type Receipt, type ReceiptDAO }
