<script setup lang="ts">
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'

import ImageUpload from './ImageUpload.vue'
import PrimaryButton from './buttons/PrimaryButton.vue'

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

const btnText = computed(() => (loading.value ? 'Loading ...' : 'Update Recipe'))
</script>
<template>
  <form @submit.prevent="onSubmit" class="flex flex-col gap-4">
    <ImageUpload v-model="recipe.images" />
    <div>
      <label class="block mb-2 text-sm font-medium" for="name">Name</label>
      <input
        class="border border-primary text-sm rounded-lg block w-full p-2.5"
        id="name"
        type="text"
        v-model="recipe!.name"
      />
    </div>
    <div>
      <label class="block mb-2 text-sm font-medium" for="description">Description</label>
      <textarea
        class="border border-primary text-sm rounded-lg block w-full p-2.5"
        id="description"
        type="text"
        v-model="recipe!.description"
      />
    </div>
    <div>
      <PrimaryButton type="submit">{{ btnText }}</PrimaryButton>
    </div>
  </form>
</template>
