import { supabase } from '@/supabase'
import type { Category } from '@/types/category'
import type { CategoryDto } from './dto'
import { mapToDomain } from './mapper'

const getCategories = async (): Promise<Category[]> => {
  const { data, error } = await supabase.from('categories').select().returns<CategoryDto[]>()

  if (error) throw error

  return await Promise.all(data.map(async (el) => mapToDomain(el)))
}

export { getCategories }
