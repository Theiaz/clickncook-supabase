<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useRecipeStore } from '@/stores/recipe'
import type { Recipe } from '@/types/recipe'
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'

const loading = ref<boolean>(false)
const recipe = ref<Omit<Recipe, 'id' | 'imgUrl' | 'authorId'>>({
  name: '',
  description: '',
  imgName: ''
})

const recipeStore = useRecipeStore()
const router = useRouter()

const onSubmit = async () => {
  recipeStore.createRecipe(recipe.value)
  await router.push({ name: 'home' })
}

const loadingText = computed(() => (loading.value ? 'Loading ...' : 'Create Recipe'))
</script>
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="recipe.name" />
    </div>
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="recipe.description" />
    </div>
    <ImageUpload v-model="recipe.imgName" />
    <div>
      <button type="submit" :aria-busy="loading">{{ loadingText }}</button>
    </div>
  </form>
</template>
