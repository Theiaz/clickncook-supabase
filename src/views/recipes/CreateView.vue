<script setup lang="ts">
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import ImageUpload from '@/components/images/ImageUpload.vue'
import RecipeRating from '@/components/rating/RecipeRating.vue'
import CookingTime from '@/components/recipes/CookingTime.vue'
import BottomButtonLayout from '@/layouts/BottomButtonLayout.vue'
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
  <BottomButtonLayout>
    <template #content>
      <form class="flex flex-col gap-4">
        <ImageUpload v-model="recipe!.images" />
        <div>
          <label class="block mb-2 text-sm font-medium" for="name">Name</label>
          <input
            class="border border-primary text-sm rounded-lg block w-full p-2.5"
            id="name"
            type="text"
            v-model="recipe!.name"
          />
        </div>
        <RecipeRating v-model="recipe.rating" :is-readonly="false" />
        <CookingTime v-model="recipe.cookingTime" :is-readonly="false" />
        <div>
          <label class="block mb-2 text-sm font-medium" for="description">Description</label>
          <textarea
            class="border border-primary text-sm rounded-lg block w-full p-2.5"
            id="description"
            type="text"
            v-model="recipe!.description"
          />
        </div>
      </form>
    </template>
    <template #actions>
      <PrimaryButton @click="onSubmit">{{ btnText }}</PrimaryButton>
    </template>
  </BottomButtonLayout>
</template>
