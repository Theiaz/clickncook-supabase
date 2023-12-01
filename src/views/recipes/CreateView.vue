<script setup lang="ts">
import RecipeGrid from '@/components/RecipeGrid.vue'
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import BaseInput from '@/components/forms/BaseInput.vue'
import BaseTextArea from '@/components/forms/BaseTextArea.vue'
import ImageUpload from '@/components/images/ImageUpload.vue'
import RecipeRating from '@/components/rating/RecipeRating.vue'
import CookingTime from '@/components/recipes/CookingTime.vue'
import StickyBottomLayout from '@/layouts/StickyBottomLayout.vue'
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
  <StickyBottomLayout>
    <template #content>
      <RecipeGrid>
        <template #left>
          <ImageUpload v-model="recipe!.images" />
          <BaseInput v-model="recipe.name" type="text" label="Name" />
          <RecipeRating v-model="recipe.rating" :is-readonly="false" />
          <CookingTime v-model="recipe.cookingTime" :is-readonly="false" />
        </template>
        <template #right>
          <BaseTextArea v-model="recipe.description" label="Description"/>
        </template>
      </RecipeGrid>
    </template>
    <template #actions>
      <PrimaryButton @click="onSubmit">{{ btnText }}</PrimaryButton>
    </template>
  </StickyBottomLayout>
</template>
