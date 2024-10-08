<script setup lang="ts">
import RecipeGrid from '@/components/RecipeGrid.vue'
import RecipeCategories from '@/components/categories/RecipeCategories.vue'
import ImageUpload from '@/components/images/ImageUpload.vue'
import RecipeRating from '@/components/rating/RecipeRating.vue'
import CookingTime from '@/components/recipes/CookingTime.vue'
import Button from '@/components/ui/button/Button.vue'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import StickyBottomLayout from '@/layouts/StickyBottomLayout.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import type { Recipe } from '@/types/recipe'
import { deepEqual } from '@/util/deepEqual'
import { storeToRefs } from 'pinia'
import type { Ref } from 'vue'
import { computed, onBeforeMount, ref, watch } from 'vue'
import { onBeforeRouteLeave, useRouter } from 'vue-router'

const props = defineProps<{
  id: string
}>()

const router = useRouter()
const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)
const tempRecipe: Ref<Recipe> = ref({ ...recipe.value })

onBeforeMount(async () => {
  if (!recipe.value.id || recipe.value.id !== props.id) {
    await recipeStore.fetchRecipe(props.id)
    tempRecipe.value = { ...recipe.value }
  }
})

const submitting = ref(false)
const onSubmit = async () => {
  if (tempRecipe.value) {
    submitting.value = true
    hasBeenEdited.value = false // user expect that he updated
    await recipeStore.updateRecipe(tempRecipe.value)
    submitting.value = false
    await router.push({ name: 'home' })
  }
}

const hasBeenEdited = ref<boolean>(false)
watch(
  tempRecipe,
  () => {
    if (
      deepEqual(recipe.value, tempRecipe.value) &&
      deepEqual(recipe.value.images, tempRecipe.value.images)
    ) {
      hasBeenEdited.value = false
      return
    }
    hasBeenEdited.value = true
  },
  { deep: true }
)

onBeforeRouteLeave(() => {
  if (hasBeenEdited.value) {
    const answer = window.confirm('Do you really want to leave? You have unsaved changes!')
    // cancel the navigation and stay on the same page
    if (!answer) return false
  }
  return true
})

const btnText = computed(() => (submitting.value ? 'Updating ...' : 'Update Recipe'))
</script>
<template>
  <StickyBottomLayout>
    <template #content>
      <RecipeGrid v-if="tempRecipe">
        <template #left>
          <ImageUpload v-model="tempRecipe.images" />
          <div class="grid w-full max-w-sm items-center gap-1.5">
            <Label for="name">Name</Label>
            <Input id="name" v-model="tempRecipe.name" type="text" v-focus />
          </div>
          <RecipeRating v-model="tempRecipe.rating" :is-readonly="false" />
          <CookingTime v-model="tempRecipe.cookingTime" :is-readonly="false" />
        </template>
        <template #right>
          <div class="grid w-full gap-1.5">
            <Label for="description">Description</Label>
            <Textarea id="description" v-model="tempRecipe.description" />
          </div>
          <RecipeCategories v-model="tempRecipe.categories" :is-readonly="false" />
        </template>
      </RecipeGrid>
      <p v-else>Something went wrong! Please try to reload this page.</p>
    </template>
    <template #actions>
      <Button @click="onSubmit">{{ btnText }}</Button>
    </template>
  </StickyBottomLayout>
</template>
