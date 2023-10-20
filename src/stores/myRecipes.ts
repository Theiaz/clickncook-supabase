import { findRecipesByAuthorId } from '@/api/recipes/api'
import { useUser } from '@/composables/useUser'
import type { Recipe } from '@/types/recipe'
import { acceptHMRUpdate, defineStore } from 'pinia'
import { ref, type Ref } from 'vue'

export const useMyRecipesStore = defineStore('myRecipes', () => {
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

  const addRecipe = (recipe: Recipe) => {
    recipes.value.push(recipe)
  }

  const updateRecipe = (recipe: Recipe) => {
    const index = recipes.value.findIndex((el) => el.id === recipe.id)
    recipes.value[index] = recipe
  }

  const deleteRecipe = (recipe: Recipe) => {
    recipes.value = recipes.value.filter((el) => el.id !== recipe.id)
  }

  return {
    recipes,
    getMyRecipes,
    addRecipe,
    updateRecipe,
    deleteRecipe
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useMyRecipesStore, import.meta.hot))
}
