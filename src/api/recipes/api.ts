import { supabase } from '@/supabase'
import type { Recipe, RecipeData } from '@/types/recipe'
import type { RecipeDto, RecipeInsertDto, RecipeUpdateDto } from './dto'
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
  const { data } = await supabase.rpc('get_random_recipe').maybeSingle()

  return data ? await mapToDomain(data) : null
}

const createRecipeForUser = async (recipe: RecipeData, userId: string): Promise<Recipe> => {
  const dto: RecipeInsertDto = {
    name: recipe.name,
    description: recipe.description!,
    rating: recipe.rating,
    cooking_time: recipe.cookingTime,
    author_id: userId // TODO schaefer - can we delete this cause supabase tracks it?
  }

  const category_ids = recipe.categories.map((c) => c.id)
  const { data, error } = await supabase
    .rpc('create_recipe', { recipe_data: dto, category_ids })
    .maybeSingle()

  if (!data) {
    throw new Error('Creation of recipe failed')
  }

  if (error) throw error

  await uploadImages(data.id, recipe.images)
  return await mapToDomain(data)
}

const updateRecipe = async (recipe: Recipe): Promise<void> => {
  const dto: RecipeUpdateDto = {
    name: recipe.name,
    description: recipe.description!,
    rating: recipe.rating,
    cooking_time: recipe.cookingTime
  }

  const { error } = await supabase.from('recipes').update(dto).eq('id', recipe.id)

  if (error) throw error

  await deleteImages(recipe.id, [], { all: true })
  await uploadImages(recipe.id, recipe.images)
}

const deleteRecipe = async (recipe: Recipe): Promise<void> => {
  const { error: errorRecipe } = await supabase.from('recipes').delete().eq('id', recipe.id)
  if (errorRecipe) throw errorRecipe

  await deleteImages(recipe.id, [], { all: true })
}

// image
const uploadImages = async (recipeId: string, images: File[]): Promise<void> => {
  for (const img of images) {
    const { error } = await supabase.storage
      .from('recipe_images')
      .upload(`${recipeId}/${img.name}`, img, { upsert: true })
    if (error) throw error
  }
}

const deleteImages = async (
  recipeId: string,
  imgNames: string[],
  options: { all: boolean } = { all: false }
): Promise<void> => {
  let filesToRemove: string[] = []
  if (options.all) {
    const { data: peristedImages, error: listError } = await supabase.storage
      .from('recipe_images')
      .list(`${recipeId}`)
    if (listError) throw listError

    filesToRemove = peristedImages.map((img) => `${recipeId}/${img.name}`)
  } else {
    filesToRemove = imgNames.map((name) => `${recipeId}/${name}`)
  }

  if (filesToRemove.length == 0) {
    return
  }
  const { error } = await supabase.storage.from('recipe_images').remove(filesToRemove)
  if (error) throw error
}

const getImagesForRecipe = async (recipeId: string): Promise<File[]> => {
  const { data: imgList, error } = await supabase.storage.from('recipe_images').list(`${recipeId}`)

  if (error) throw error

  const images: File[] = []
  if (imgList) {
    for (const img of imgList) {
      const { data, error } = await supabase.storage
        .from('recipe_images')
        .download(`${recipeId}/${img.name}`)
      if (error) throw error

      images.push(new File([data], img.name))
    }
  }

  return images
}

export {
  createRecipeForUser,
  deleteImages,
  deleteRecipe,
  findRandomRecipe,
  findRecipeById,
  findRecipesByAuthorId,
  getImagesForRecipe,
  updateRecipe,
  uploadImages as uploadImage
}
