<script setup lang="ts">
import { supabase } from '@/supabase'
import { onBeforeMount, ref } from 'vue'

const inProgress = ref<boolean>(false)
const hasError = ref<boolean>(false)
const file = ref<File | null>()
const src = ref<string>('')

const props = defineProps<{
  modelValue: string
}>()
const emit = defineEmits<{
  'update:modelValue': [modelValue: string]
}>()

onBeforeMount(() => {
  src.value = props.modelValue
})

async function uploadImage() {
  try {
    inProgress.value = true
    const fileExt = file.value!.name.split('.').pop()
    const filename = `${crypto.randomUUID()}.${fileExt}`
    const { error } = await supabase.storage.from('receipt_images').upload(filename, file.value!)

    if (error) throw error

    emit('update:modelValue', filename)
  } catch (error) {
    hasError.value = true
  } finally {
    inProgress.value = false
  }
}

function onFileSelected(event: Event) {
  const target = event.target as HTMLInputElement
  if (!target.files) {
    return
  }
  file.value = target.files[0]

  src.value = URL.createObjectURL(file.value)

  uploadImage()
}
</script>
<template>
  <img v-if="src" :src="src" :alt="file?.name" />
  <label>
    <div v-show="inProgress">Uploading...</div>
    <p v-if="hasError">An error occured during image upload!</p>
    <input type="file" accept="image/*" ref="imageInput" @change="onFileSelected($event)" />
  </label>
</template>
