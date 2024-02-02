import type { Category } from '@/types/category'
import type { CategoryDto } from './dto'

const mapToDomain = async (data: CategoryDto): Promise<Category> => {
  return {
    id: data.id,
    name: data.name,
  }
}

export { mapToDomain }
