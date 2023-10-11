import type { Recipe } from '@/types/recipe'
import { getPublicUrlForImage } from './api'
import type { RecipeDto } from './dto'

const mapToDomain = async (data: RecipeDto): Promise<Recipe> => {
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
