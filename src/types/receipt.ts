import { supabase } from '@/supabase'
import type { Database } from '../schemas/schema'
import type { Author } from './author'

interface Receipt {
  id: string
  name: string | null
  description?: string
  imgUrl?: string
  imgName?: string
  authorId: Author['id']
}

type ReceiptDAO = Omit<Database['public']['Tables']['receipts']['Row'], 'created_at'>

const mapToDomain = async (data: ReceiptDAO): Promise<Receipt> => {
  return {
    id: data.id,
    name: data.name,
    description: data.description ?? '',
    imgUrl: await mapImageNameToPublicURL(data.img_name),
    imgName: data.img_name ?? '',
    authorId: data.author_id!
  }
}

const mapImageNameToPublicURL = async (name: ReceiptDAO['img_name']): Promise<string> => {
  if (name === '') {
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
    img_name: data.imgName!
  }
}

export { mapToDAO, mapToDomain, type Receipt, type ReceiptDAO }
