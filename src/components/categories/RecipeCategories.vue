<script setup lang="ts">
import { getCategories } from '@/api/categories/api'
import EditIcon from '@/components/icons/EditIcon.vue'
import { Badge } from '@/components/ui/badge'
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
import type { Category } from '@/types/category'
import { onBeforeMount, ref, watch } from 'vue'

const props = withDefaults(
  defineProps<{
    modelValue: Category[]
    isReadonly?: boolean
  }>(),
  {
    isReadonly: true
  }
)

const emit = defineEmits<{
  'update:modelValue': [modelValue: Category[]]
}>()

// available categories
const availableCategories = ref<Category[]>([])
onBeforeMount(async () => {
  availableCategories.value = await getCategories()
})

// selection
const selectedCategories = ref<Category[]>(props.modelValue)
watch(
  () => props.modelValue,
  (newValue) => {
    selectedCategories.value = newValue
  }
)

const toggleSelection = (selectedCategory: Category) => {
  if (selectedCategories.value.map((c) => c.id).includes(selectedCategory.id)) {
    selectedCategories.value = selectedCategories.value.filter((c) => c.id !== selectedCategory.id)
  } else {
    selectedCategories.value.push(selectedCategory)
  }
  emit('update:modelValue', selectedCategories.value)
}
</script>
<template>
  <label class="block text-sm font-medium">Categories</label>
  <div class="flex gap-4">
    <Popover v-if="!isReadonly">
      <PopoverTrigger>
        <EditIcon />
      </PopoverTrigger>
      <PopoverContent class="flex gap-4 flex-wrap mx-8 my-2">
        <Badge
          v-for="category in availableCategories"
          :key="category.id"
          class="snap-center cursor-pointer"
          :variant="
            selectedCategories.map((c) => c.id).includes(category.id) ? 'default' : 'outline'
          "
          @click="toggleSelection(category)"
        >
          {{ category.name }}
        </Badge>
      </PopoverContent>
    </Popover>
    <div class="w-full flex gap-4 overflow-x-scroll snap-x snap-mandatory no-scrollbar">
      <Badge v-for="category in selectedCategories" :key="category.id" class="snap-center">
        {{ category.name }}
      </Badge>
    </div>
  </div>
</template>
<style scoped>
/* Hide scrollbar for Chrome, Safari, and Opera */
.no-scrollbar::-webkit-scrollbar {
  display: none;
}

/* Hide scrollbar for IE, Edge, and Firefox */
.no-scrollbar {
  -ms-overflow-style: none; /* IE and Edge */
  scrollbar-width: none; /* Firefox */
}
</style>
