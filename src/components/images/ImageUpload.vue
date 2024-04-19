<script setup lang="ts">
import { compressImages } from '@/api/image-compression/api'
import CameraAddIcon from '@/components/icons/CameraAddIcon.vue'
import TrashIcon from '@/components/icons/TrashIcon.vue'
import { config } from '@/config'
import { onBeforeMount, ref, watch } from 'vue'
import Button from '../ui/button/Button.vue'
import ImageCarousel from './ImageCarousel.vue'

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

  if (config.enableImageCompression) {
    const compressedImages = await compressImages(target.files)
    if (compressedImages && compressedImages.length > 0) {
      files.value.push(...compressedImages)
      emit('update:modelValue', files.value)
    }
  } else {
    files.value.push(...target.files)
    emit('update:modelValue', files.value)
  }
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
      <label
        class="p-2 hover:cursor-pointer hover:bg-accent hover:text-accent-foreground rounded-md"
      >
        <input
          class="hidden"
          type="file"
          accept="image/*"
          multiple
          @change="addImages($event)"
          data-test="image-upload"
        />
        <CameraAddIcon />
      </label>
      <Button size="icon" variant="ghost" @click="deleteImage(slotProps.currentImage)">
        <TrashIcon />
      </Button>
    </template>
  </ImageCarousel>
</template>
<style scoped>
.full-width {
  @apply relative left-1/2 right-1/2 w-screen max-w-[100vw] -mx-[50vw];
}

@container recipe (width > 700px) {
  .full-width {
    @apply static w-full mx-0;
  }
}
</style>
