<script setup lang="ts">
import RecipeGrid from '@/components/RecipeGrid.vue'
import ImageUpload from '@/components/images/ImageUpload.vue'
import RecipeRating from '@/components/rating/RecipeRating.vue'
import CookingTime from '@/components/recipes/CookingTime.vue'
import Button from '@/components/ui/button/Button.vue'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
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
          <div class="grid w-full max-w-sm items-center gap-1.5">
            <Label for="name">Name</Label>
            <Input id="name" v-model="recipe.name" type="text" v-focus />
          </div>
          <RecipeRating v-model="recipe.rating" :is-readonly="false" />
          <CookingTime v-model="recipe.cookingTime" :is-readonly="false" />
        </template>
        <template #right>
          <div class="grid w-full gap-1.5">
            <Label for="description">Description</Label>
            <Textarea id="description" v-model="recipe.description" />
          </div>
        </template>
      </RecipeGrid>
    </template>
    <template #actions>
      <Button @click="onSubmit">{{ btnText }}</Button>
    </template>
  </StickyBottomLayout>
</template>
