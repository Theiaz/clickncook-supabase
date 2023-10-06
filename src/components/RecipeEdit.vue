<script setup lang="ts">
import { useRecipeStore } from '@/stores/recipe'
import { storeToRefs } from 'pinia'
import { useRouter } from 'vue-router'
import ImageUpload from './ImageUpload.vue'

const router = useRouter()
const recipeStore = useRecipeStore()
const { recipe } = storeToRefs(recipeStore)

const onSubmit = async () => {
  if (recipe.value) {
    await recipeStore.updateRecipe(recipe.value)
    await router.push({ name: 'home' })
  }
}
</script>
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="recipe!.name" />
    </div>
    <ImageUpload v-model="recipe!.imgName" />
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="recipe!.description" />
    </div>
    <div>
      <button type="submit">Edit recipe</button>
    </div>
  </form>
</template>
