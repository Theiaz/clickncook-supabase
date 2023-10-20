<script setup lang="ts">
import ActionBar from '@/components/ActionBar.vue'
import RecipeEdit from '@/components/RecipeEdit.vue'
import RecipeReadonly from '@/components/RecipeReadonly.vue'
import { useUser } from '@/composables/useUser'
import { useRecipeStore } from '@/stores/recipe'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'

const props = defineProps<{
  id: string
}>()

const recipeStore = useRecipeStore()
const { recipe } = storeToRefs(recipeStore)

const { user } = useUser()
const isOwnRecipe = computed(() => recipe.value!.authorId === user.value?.id)
const isEditing = ref<boolean>(false)

const loading = ref<boolean>(false)
onBeforeMount(async () => {
  if (recipe.value === null || recipe.value!.id !== props.id) {
    loading.value = true
    await recipeStore.getRecipeById(props.id)
    loading.value = false
  }
})
</script>
<template>
  <section :aria-buy="loading">
    <template v-if="recipe">
      <ActionBar v-if="isOwnRecipe">
        <label for="switch-1">
          <input type="checkbox" id="switch-1" name="switch-1" role="switch" v-model="isEditing" />
          Edit recipe
        </label>
        <button @click="recipeStore.deleteRecipe(recipe)">Delete</button>
      </ActionBar>
      <RecipeEdit v-if="isEditing" :recipe="recipe!" />
      <RecipeReadonly v-else :recipe="recipe!" />
    </template>
    <p v-else>Something went wrong! Please try to reload this page.</p>
  </section>
</template>
