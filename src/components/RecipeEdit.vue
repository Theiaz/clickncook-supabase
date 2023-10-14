<script setup lang="ts">
import { deleteImages } from '@/api/recipes/api'
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

function toSrc(file: File) {
  return URL.createObjectURL(file)
}

async function deleteImage(file: File) {
  if (recipe.value) {
    recipe.value.images = recipe.value?.images.filter((img) => file.name !== img.name)
    await deleteImages(recipe.value.id, [file.name])
  }
}
</script>
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="recipe!.name" />
    </div>
    <template v-for="file in recipe!.images" :key="file.name">
      <img :src="toSrc(file)" :alt="file?.name" />
      <button type="button" @click="deleteImage(file)">Delete image</button>
    </template>

    <ImageUpload v-model="recipe!.images" />
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="recipe!.description" />
    </div>
    <div>
      <button type="submit">Edit recipe</button>
    </div>
  </form>
</template>
