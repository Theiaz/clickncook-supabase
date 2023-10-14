<script setup lang="ts">
import { onBeforeMount, ref } from 'vue'

const inProgress = ref<boolean>(false)
const hasError = ref<boolean>(false)
const files = ref<File[]>([])

const props = defineProps<{
  modelValue: File[] | undefined
}>()
const emit = defineEmits<{
  'update:modelValue': [modelValue: File[]]
}>()

onBeforeMount(() => {
  if (props.modelValue) {
    files.value = props.modelValue
  }
})

async function onFilesSelected(event: Event) {
  const target = event.target as HTMLInputElement
  if (!target.files) {
    return
  }
  files.value!.push(...Array.from(target.files))

  emit('update:modelValue', files.value)
}
</script>
<template>
  <label>
    <div v-show="inProgress" :aria-busy="inProgress">Uploading image...</div>
    <p v-if="hasError">An error occured during image upload!</p>
    <input
      type="file"
      accept="image/*"
      ref="imageInput"
      multiple
      @change="onFilesSelected($event)"
    />
  </label>
</template>
<style scoped>
img {
  margin-bottom: 1rem;
}
</style>
