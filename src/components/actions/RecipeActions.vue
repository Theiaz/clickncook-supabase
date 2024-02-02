<script setup lang="ts">
import router from '@/router'
import { useCurrentRecipeStore } from '@/stores/currentRecipe'
import type { Recipe } from '@/types/recipe'
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import DetailsIcon from '../icons/DetailsIcon.vue'
import EditIcon from '../icons/EditIcon.vue'
import TrashIcon from '../icons/TrashIcon.vue'
import Button from '../ui/button/Button.vue'

const props = defineProps<{
  recipe: Recipe
}>()

const recipeStore = useCurrentRecipeStore()
const route = useRoute()
const isMyRecipeScreen = computed(() => route.name === 'myRecipes')

const onDelete = async () => {
  if (props.recipe) {
    await recipeStore.deleteRecipe(props.recipe)
    await router.push({ name: 'home' })
  }
}
</script>
<template>
  <div class="flex gap-4">
    <router-link
      v-if="isMyRecipeScreen"
      :to="{ name: 'details', params: { id: recipe.id } }"
      v-slot="{ href, navigate }"
    >
      <Button variant="ghost" size="icon" :href="href" @click="navigate">
        <DetailsIcon />
      </Button>
    </router-link>
    <router-link :to="{ name: 'edit', params: { id: recipe.id } }" v-slot="{ href, navigate }">
      <Button variant="ghost" size="icon" :href="href" @click="navigate">
        <EditIcon />
      </Button>
    </router-link>
    <Button variant="ghost" size="icon" @click="onDelete">
      <TrashIcon />
    </Button>
  </div>
</template>
