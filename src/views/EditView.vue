<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps<{
  id: string
}>()

const router = useRouter()
const recipeStore = useCurrentRecipeStore()
const { recipe } = storeToRefs(recipeStore)

onBeforeMount(async () => {
  if (!recipe.value.id || recipe.value.id !== props.id) {
    await recipeStore.fetchRecipe(props.id)
  }
})

const submitting = ref(false)
const onSubmit = async () => {
  if (recipe.value) {
    submitting.value = true
    // TODO schaefer - we already write in the store
    await recipeStore.updateRecipe(recipe.value)
    submitting.value = false
    await router.push({ name: 'home' })
  }
}

const btnText = computed(() => (submitting.value ? 'Loading ...' : 'Update Recipe'))
</script>
<template>
  <template v-if="recipe">
    <form @submit.prevent="onSubmit" class="flex flex-col gap-4">
      <ImageUpload v-model="recipe.images" />
      <div>
        <label class="block mb-2 text-sm font-medium" for="name">Name</label>
        <input
          class="border border-primary text-sm rounded-lg block w-full p-2.5"
          id="name"
          type="text"
          v-model="recipe.name"
        />
      </div>
      <div>
        <label class="block mb-2 text-sm font-medium" for="description">Description</label>
        <textarea
          class="border border-primary text-sm rounded-lg block w-full p-2.5"
          id="description"
          type="text"
          v-model="recipe.description"
        />
      </div>
      <div>
        <PrimaryButton type="submit">{{ btnText }}</PrimaryButton>
      </div>
    </form>
  </template>
  <p v-else>Something went wrong! Please try to reload this page.</p>
</template>
