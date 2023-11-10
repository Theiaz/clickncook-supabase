<script setup lang="ts">
import { onBeforeMount, ref, watch } from 'vue'
import ImageCarousel from './ImageCarousel.vue'
import AddIcon from './icons/AddIcon.vue'
import TrashIcon from './icons/TrashIcon.vue'

const props = defineProps<{
  modelValue: File[] | undefined
}>()
const emit = defineEmits<{
  'update:modelValue': [modelValue: File[]]
}>()

const inProgress = ref<boolean>(false)
const hasError = ref<boolean>(false)
const files = ref<File[]>([])

onBeforeMount(() => {
  if (!props.modelValue) {
    return
  }
  files.value = props.modelValue
})
watch(
  () => props.modelValue,
  () => {
    if (!props.modelValue) {
      return
    }
    files.value = props.modelValue
  },
  { deep: true }
)

async function addImages(event: Event) {
  const target = event.target as HTMLInputElement
  if (!target.files) {
    return
  }

  files.value.push(...Array.from(target.files))
  emit('update:modelValue', files.value)
}

function deleteImage(file: File) {
  if (files.value.length <= 0) {
    return
  }

  files.value = files.value.filter((img) => img.name !== file.name)
  emit('update:modelValue', files.value)
}
</script>
<template>
  <div v-show="inProgress" :aria-busy="inProgress">Uploading image...</div>
  <p v-if="hasError">An error occured during image upload!</p>
  <ImageCarousel class="full-width" :images="files!">
    <template v-slot:actions="slotProps">
      <label class="p-2 hover:cursor-pointer">
        <input class="hidden" type="file" accept="image/*" multiple @change="addImages($event)" />
        <AddIcon />
      </label>
      <button type="button" @click="deleteImage(slotProps.currentImage)">
        <TrashIcon />
      </button>
    </template>
  </ImageCarousel>
</template>
<style scoped>
.full-width {
  @apply relative left-1/2 right-1/2 w-[100dvw]  -mx-[50vw];
}
</style>
