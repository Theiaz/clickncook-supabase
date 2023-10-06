import { supabase } from '@/supabase'
import type { Recipe } from '@/types/recipe'
import type { RecipeDto, RecipeInsertDto, RecipeUpdateDto } from '@/types/supabase'
import { mapToDomain } from './mapper'

const findRecipesByAuthorId = async (id: string): Promise<Recipe[]> => {
  const { data, error } = await supabase
    .from('recipes')
    .select()
    .eq('author_id', id)
    .returns<RecipeDto[]>()

  if (error) throw error

  return await Promise.all(data.map(async (el) => mapToDomain(el)))
}

const findRecipeById = async (id: string): Promise<Recipe> => {
  const { data, error } = await supabase.from('recipes').select('*').eq('id', id).maybeSingle()

  if (error) throw error

  if (!data) {
    throw Error(`No recipe for id ${id} could be found!`)
  }

  return await mapToDomain(data)
}

const findRandomRecipe = async (): Promise<Recipe | null> => {
  const { data, error } = await supabase.rpc('get_random_recipe').maybeSingle()

  if (error) throw error

  return data ? await mapToDomain(data) : null
}

const createRecipeForUser = async (
  recipe: Omit<Recipe, 'id' | 'imgUrl' | 'authorId'>,
  userId: string
): Promise<void> => {
  const dto: RecipeInsertDto = {
    name: recipe.name,
    description: recipe.description!,
    author_id: userId, // TODO schaefer - can we delete this cause supabase tracks it?
    img_name: recipe.imgName!
  }

  const { error } = await supabase.from('recipes').insert(dto)

  if (error) throw error
}

const updateRecipe = async (recipe: Recipe): Promise<void> => {
  const dto: RecipeUpdateDto = {
    name: recipe.name,
    description: recipe.description!,
    img_name: recipe.imgName!
  }

  const { error } = await supabase.from('recipes').update(dto).eq('id', recipe.id)

  if (error) throw error
}

const deleteRecipe = async (recipe: Recipe): Promise<void> => {
  const { error: errorRecipe } = await supabase.from('recipes').delete().eq('id', recipe.id)
  if (errorRecipe) throw errorRecipe

  deleteImage(recipe.imgName!)
}

// image
const uploadImage = async (file: File, filename: string): Promise<void> => {
  const { error } = await supabase.storage.from('recipe_images').upload(filename, file)

  if (error) throw error
}

const deleteImage = async (imgName: string): Promise<void> => {
  const { error: errorImg } = await supabase.storage.from('recipe_images').remove([imgName])
  if (errorImg) throw errorImg
}

const getPublicUrlForImage = async (imgName: string): Promise<string> => {
  const { data } = await supabase.storage.from('recipe_images').getPublicUrl(imgName)
  return data.publicUrl
}

export {
  createRecipeForUser,
  deleteImage,
  deleteRecipe,
  findRandomRecipe,
  findRecipeById,
  findRecipesByAuthorId,
  getPublicUrlForImage,
  updateRecipe,
  uploadImage
}
