import { supabase } from '@/supabase'
import type { Receipt } from '@/types/receipt'
import type { ReceiptDto, ReceiptInsertDto, ReceiptUpdateDto } from '@/types/supabase'
import { mapToDomain } from './mapper'

const findReceiptsByAuthorId = async (id: string): Promise<Receipt[]> => {
  const { data, error } = await supabase
    .from('receipts')
    .select()
    .eq('author_id', id)
    .returns<ReceiptDto[]>()

  if (error) throw error

  return await Promise.all(data.map(async (el) => mapToDomain(el)))
}

const findReceiptById = async (id: string): Promise<Receipt> => {
  const { data, error } = await supabase.from('receipts').select('*').eq('id', id).maybeSingle()

  if (error) throw error

  if (!data) {
    throw Error(`No receipt for id ${id} could be found!`)
  }

  return await mapToDomain(data)
}

const findRandomReceipt = async (): Promise<Receipt | null> => {
  const { data, error } = await supabase.rpc('get_random_receipt').maybeSingle()

  if (error) throw error

  return data ? await mapToDomain(data) : null
}

const createReceiptForUser = async (
  receipt: Omit<Receipt, 'id' | 'imgUrl' | 'authorId'>,
  userId: string
): Promise<void> => {
  const dto: ReceiptInsertDto = {
    name: receipt.name,
    description: receipt.description!,
    author_id: userId, // TODO schaefer - can we delete this cause supabase tracks it?
    img_name: receipt.imgName!
  }

  const { error } = await supabase.from('receipts').insert(dto)

  if (error) throw error
}

const updateReceipt = async (receipt: Receipt): Promise<void> => {
  const dto: ReceiptUpdateDto = {
    name: receipt.name,
    description: receipt.description!,
    img_name: receipt.imgName!
  }

  const { error } = await supabase.from('receipts').update(dto).eq('id', receipt.id)

  if (error) throw error
}

const deleteReceipt = async (receipt: Receipt): Promise<void> => {
  const { error: errorReceipt } = await supabase.from('receipts').delete().eq('id', receipt.id)
  if (errorReceipt) throw errorReceipt

  deleteImage(receipt.imgName!)
}

// image
const uploadImage = async (file: File, filename: string): Promise<void> => {
  const { error } = await supabase.storage.from('receipt_images').upload(filename, file)

  if (error) throw error
}

const deleteImage = async (imgName: string): Promise<void> => {
  const { error: errorImg } = await supabase.storage.from('receipt_images').remove([imgName])
  if (errorImg) throw errorImg
}

const getPublicUrlForImage = async (imgName: string): Promise<string> => {
  const { data } = await supabase.storage.from('receipt_images').getPublicUrl(imgName)
  return data.publicUrl
}

export {
  createReceiptForUser,
  deleteImage,
  deleteReceipt,
  findRandomReceipt,
  findReceiptById,
  findReceiptsByAuthorId,
  getPublicUrlForImage,
  updateReceipt,
  uploadImage
}
