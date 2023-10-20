<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'

const loading = ref<boolean>(false)
const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)
const router = useRouter()

onBeforeMount(() => {
  recipeStore.$reset()
})

const onSubmit = async () => {
  loading.value = true
  await recipeStore.createRecipe(recipe.value!)
  loading.value = false
  await router.push({ name: 'home' })
}

const btnText = computed(() => (loading.value ? 'Loading ...' : 'Create Recipe'))
</script>
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="recipe!.name" />
    </div>
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="recipe!.description" />
    </div>
    <ImageUpload v-model="recipe!.images" />
    <div>
      <button type="submit" :aria-busy="loading">{{ btnText }}</button>
    </div>
  </form>
</template>
