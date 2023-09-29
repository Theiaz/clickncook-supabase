<script setup lang="ts">
import { deleteImage, uploadImage } from '@/api/receipts/api'
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { onBeforeMount, ref } from 'vue'

const inProgress = ref<boolean>(false)
const hasError = ref<boolean>(false)
const file = ref<File | null>()
const src = ref<string>('')

const props = defineProps<{
  modelValue: string | undefined
}>()
const emit = defineEmits<{
  'update:modelValue': [modelValue: string]
}>()

const { receipt } = storeToRefs(useReceiptStore())

onBeforeMount(() => {
  if (props.modelValue) {
    src.value = receipt.value!.imgUrl!
  }
})

async function upload() {
  inProgress.value = true
  const fileExt = file.value!.name.split('.').pop()
  const filename = `${crypto.randomUUID()}.${fileExt}`
  try {
    await uploadImage(file.value!, filename)
    emit('update:modelValue', filename)
  } catch (error) {
    hasError.value = true
  } finally {
    inProgress.value = false
  }
}

async function onFileSelected(event: Event) {
  const target = event.target as HTMLInputElement
  if (!target.files) {
    return
  }

  if (receipt.value && receipt.value.imgName) {
    try {
      await deleteImage(receipt.value.imgName)
      receipt.value.imgName = undefined
      receipt.value.imgUrl = undefined
    } catch (error) {
      alert(`Deletion of old image with name ${receipt.value.imgName} failed`)
    }
  }

  file.value = target.files[0]
  src.value = URL.createObjectURL(file.value)

  upload()
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
