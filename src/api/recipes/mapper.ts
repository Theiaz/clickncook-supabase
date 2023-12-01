import type { Recipe } from '@/types/recipe'
import { getImagesForRecipe } from './api'
import type { RecipeDto } from './dto'

const mapToDomain = async (data: RecipeDto): Promise<Recipe> => {
  return {
    id: data.id,
    name: data.name,
    description: data.description ?? undefined,
    authorId: data.author_id!,
    images: (await getImagesForRecipe(data.id)) ?? [], // TODO schaefer - this should not be empty
    rating: data.rating,
    cookingTime: data.cooking_time ?? undefined
  }
}

export { mapToDomain }
