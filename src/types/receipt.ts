import { supabase } from '@/supabase'
import type { Database } from '../schema'
import type { Author } from './author'

interface Receipt {
  id: string
  name: string | null
  description?: string
  imgUrl?: string
  authorId: Author['id']
}

type ReceiptDAO = Omit<Database['public']['Tables']['receipts']['Row'], 'created_at'>

const mapToDomain = async (data: ReceiptDAO): Promise<Receipt> => {
  return {
    id: data.id,
    name: data.name,
    description: data.description ?? '',
    authorId: data.author_id!,
    imgUrl: await mapImageNameToURL(data.img_name)
  }
}

const mapImageNameToURL = async (name: ReceiptDAO['img_name']): Promise<string> => {
  if (name === null) {
    return ''
  }

  const { data } = await supabase.storage.from('receipt_images').getPublicUrl(name!)
  return data.publicUrl
}

const mapToDAO = (data: Receipt): ReceiptDAO => {
  return {
    id: data.id,
    name: data.name,
    description: data.description!,
    author_id: data.authorId!,
    img_name: data.imgUrl!
  }
}

export { mapToDAO, mapToDomain, type Receipt, type ReceiptDAO }
