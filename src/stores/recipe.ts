import {
  deleteRecipe as apiDeleteRecipe,
  updateRecipe as apiUpdateRecipe,
  createRecipeForUser,
  findRandomRecipe,
  findRecipeById,
  findRecipesByAuthorId
} from '@/api/recipes/api'
import { useUser } from '@/composables/useUser'
import type { Recipe, RecipeData } from '@/types/recipe'
import { acceptHMRUpdate, defineStore } from 'pinia'
import { ref, type Ref } from 'vue'

export const useRecipeStore = defineStore('recipe', () => {
  // user recipes
  const recipes: Ref<Recipe[]> = ref([])
  const { user } = useUser()
  const getMyRecipes = async () => {
    if (user.value) {
      try {
        recipes.value = await findRecipesByAuthorId(user.value?.id)
      } catch (error) {
        alert(error)
      }
    }
  }
  getMyRecipes()

  // current recipe
  const recipe: Ref<Recipe | null> = ref(null)
  const getRecipeById = async (id: string) => {
    try {
      recipe.value = await findRecipeById(id)
    } catch (error: any) {
      alert(error.message)
    }
  }

  const getRandomRecipe = async () => {
    try {
      recipe.value = await findRandomRecipe()
    } catch (error: any) {
      alert(error.message)
    }
  }

  const createRecipe = async (recipe: RecipeData) => {
    try {
      if (user.value) {
        await createRecipeForUser(recipe, user.value.id)
      }
    } catch (error: any) {
      alert(error.message)
    }
  }

  const updateRecipe = async (recipe: Recipe) => {
    try {
      await apiUpdateRecipe(recipe)
    } catch (error: any) {
      alert(error.message)
    }
  }

  const deleteRecipe = async (recipe: Recipe) => {
    try {
      await apiDeleteRecipe(recipe)

      recipes.value = recipes.value.filter((el) => el.id !== recipe.id)
    } catch (error: any) {
      alert(error.message)
    }
  }

  return {
    recipes,
    getMyRecipes,
    recipe,
    getRecipeById,
    getRandomRecipe,
    createRecipe,
    updateRecipe,
    deleteRecipe
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useRecipeStore, import.meta.hot))
}
