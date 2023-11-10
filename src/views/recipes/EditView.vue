<script setup lang="ts">
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import ImageUpload from '@/components/images/ImageUpload.vue'
import BottomButtonLayout from '@/layouts/BottomButtonLayout.vue'
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
  <BottomButtonLayout>
    <template #content>
      <template v-if="tempRecipe">
        <form class="flex flex-col gap-4">
          <ImageUpload v-model="tempRecipe.images" />
          <div>
            <label class="block mb-2 text-sm font-medium" for="name">Name</label>
            <input
              class="border border-primary text-sm rounded-lg block w-full p-2.5"
              id="name"
              type="text"
              v-model="tempRecipe.name"
            />
          </div>
          <div>
            <label class="block mb-2 text-sm font-medium" for="description">Description</label>
            <textarea
              class="border border-primary text-sm rounded-lg block w-full p-2.5"
              id="description"
              type="text"
              v-model="tempRecipe.description"
            />
          </div>
        </form>
      </template>
      <p v-else>Something went wrong! Please try to reload this page.</p>
    </template>
    <template #actions>
      <PrimaryButton @click="onSubmit">{{ btnText }}</PrimaryButton>
    </template>
  </BottomButtonLayout>
</template>
