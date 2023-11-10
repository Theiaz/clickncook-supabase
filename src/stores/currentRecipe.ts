import {
  deleteRecipe as apiDeleteRecipe,
  updateRecipe as apiUpdateRecipe,
  createRecipeForUser,
  deleteImages,
  findRecipeById
} from '@/api/recipes/api'
import { useUser } from '@/composables/useUser'
import type { Recipe, RecipeData } from '@/types/recipe'
import { acceptHMRUpdate, defineStore } from 'pinia'
import { ref, type Ref } from 'vue'
import { useMyRecipesStore } from './myRecipes'

export const useCurrentRecipeStore = defineStore('currentRecipe', () => {
  const currentRecipe: Ref<Recipe> = ref({
    id: '',
    authorId: '',
    name: '',
    description: '',
    images: []
  })
  const myRecipeStore = useMyRecipesStore()

  const $reset = () => {
    currentRecipe.value = {
      id: '',
      authorId: '',
      name: '',
      description: '',
      images: []
    }
  }

  const fetchRecipe = async (id: string) => {
    try {
      // load from my recipes if available
      const myRecipe = myRecipeStore.getRecipeById(id)
      if (myRecipe) {
        console.log('fetch from my store', myRecipe)

        currentRecipe.value = myRecipe
        return
      }
      // else fetch it
      currentRecipe.value = await findRecipeById(id)
    } catch (error: any) {
      alert(error.message)
    }
  }
  const createRecipe = async (recipe: RecipeData) => {
    const { user } = useUser()
    try {
      if (user.value) {
        const createdRecipe = await createRecipeForUser(recipe, user.value.id)
        myRecipeStore.addRecipe(createdRecipe)
      }
    } catch (error: any) {
      alert(error.message)
    }
  }

  const updateRecipe = async (recipe: Recipe) => {
    try {
      await apiUpdateRecipe(recipe)
      myRecipeStore.updateRecipe(recipe)
    } catch (error: any) {
      alert(error.message)
    }
  }

  const deleteRecipe = async (recipe: Recipe) => {
    try {
      await apiDeleteRecipe(recipe)
      myRecipeStore.deleteRecipe(recipe)
    } catch (error: any) {
      alert(error.message)
    }
  }

  // TODO schaefer - operations for images like delete?
  const deleteImage = async (file: File) => {
    currentRecipe.value.images = currentRecipe.value?.images.filter((img) => file.name !== img.name)
    await deleteImages(currentRecipe.value.id!, [file.name])
  }

  return {
    recipe: currentRecipe,
    $reset,
    fetchRecipe,
    createRecipe,
    updateRecipe,
    deleteRecipe,
    deleteImage
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useCurrentRecipeStore, import.meta.hot))
}
