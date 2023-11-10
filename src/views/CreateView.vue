<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
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
