<script setup lang="ts">
import { deleteImages } from '@/api/recipes/api'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'
import ImageUpload from './ImageUpload.vue'

const router = useRouter()
const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)
const loading = ref(false)

const onSubmit = async () => {
  if (recipe.value) {
    loading.value = true
    await recipeStore.updateRecipe(recipe.value)
    loading.value = false
    await router.push({ name: 'home' })
  }
}

function toSrc(file: File) {
  return URL.createObjectURL(file)
}

async function deleteImage(file: File) {
  if (recipe.value) {
    recipe.value.images = recipe.value?.images.filter((img) => file.name !== img.name)
    await deleteImages(recipe.value.id!, [file.name])
  }
}

const btnText = computed(() => (loading.value ? 'Loading ...' : 'Update Recipe'))
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
      <button type="submit" :aria-busy="loading">{{ btnText }}</button>
    </div>
  </form>
</template>
