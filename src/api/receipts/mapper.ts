import type { Receipt } from '@/types/receipt'
import type { ReceiptDto } from '@/types/supabase'
import { getPublicUrlForImage } from './api'

const mapToDomain = async (data: ReceiptDto): Promise<Receipt> => {
  return {
    id: data.id,
    name: data.name,
    description: data.description ?? '',
    imgUrl: data.img_name ? await mapImageNameToPublicURL(data.img_name) : undefined,
    imgName: data.img_name ?? '',
    authorId: data.author_id!
  }
}

const mapImageNameToPublicURL = async (name: string): Promise<string> => {
  return await getPublicUrlForImage(name)
}

export { mapToDomain }
