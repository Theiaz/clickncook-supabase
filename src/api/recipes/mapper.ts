import type { Recipe } from '@/types/recipe'
import { getImagesForRecipe } from './api'
import type { RecipeDto } from './dto'

const mapToDomain = async (data: RecipeDto): Promise<Recipe> => {
  const categories = data.categories.map((c) => ({ id: c.id, name: c.name }))
  const images = (await getImagesForRecipe(data.id)) ?? [] // TODO schaefer - this should not be empty

  return {
    id: data.id,
    name: data.name,
    description: data.description ?? undefined,
    authorId: data.author_id!,
    images,
    rating: data.rating,
    cookingTime: data.cooking_time ?? undefined,
    categories
  }
}

export { mapToDomain }
