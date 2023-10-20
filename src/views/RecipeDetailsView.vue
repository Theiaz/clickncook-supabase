<script setup lang="ts">
import { findRecipeById } from '@/api/recipes/api'
import ActionBar from '@/components/ActionBar.vue'
import RecipeEdit from '@/components/RecipeEdit.vue'
import RecipeReadonly from '@/components/RecipeReadonly.vue'
import { useUser } from '@/composables/useUser'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { useMyRecipesStore } from '@/stores/myRecipes'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps<{
  id: string
}>()

const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)
const myRecipes = useMyRecipesStore()

const { user } = useUser()
const isOwnRecipe = computed(() => recipe.value!.authorId === user.value?.id)
const isEditing = ref<boolean>(false)

const loading = ref<boolean>(false)
const loadRecipeFromStore = () => {
  loading.value = true
  const myRecipe = myRecipes.getRecipeById(props.id)
  if (myRecipe) {
    recipe.value = myRecipe
  }
  loading.value = false
}
const fetchRecipe = async () => {
  loading.value = true
  try {
    recipe.value = await findRecipeById(props.id)
  } catch (error: any) {
    alert(error.message)
  }
  loading.value = false
}

onBeforeMount(async () => {
  if (recipe.value.id !== props.id) {
    loadRecipeFromStore()
  }
  if (recipe.value.id === '') {
    fetchRecipe()
  }
})

const router = useRouter()
const onDelete = async () => {
  if (recipe.value) {
    await recipeStore.deleteRecipe(recipe.value)
    await router.push({ name: 'home' })
  }
}
</script>
<template>
  <section :aria-buy="loading">
    <template v-if="recipe">
      <ActionBar v-if="isOwnRecipe">
        <label for="switch-1">
          <input type="checkbox" id="switch-1" name="switch-1" role="switch" v-model="isEditing" />
          Edit recipe
        </label>
        <button @click="onDelete">Delete</button>
      </ActionBar>
      <RecipeEdit v-if="isEditing" :recipe="recipe!" />
      <RecipeReadonly v-else :recipe="recipe!" />
    </template>
    <p v-else>Something went wrong! Please try to reload this page.</p>
  </section>
</template>
