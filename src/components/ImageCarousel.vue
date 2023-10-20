<script setup lang="ts">
import { computed, ref } from 'vue'

const props = defineProps<{
  images: File[]
}>()

const index = ref(0)
const currentImage = computed(() => URL.createObjectURL(props.images[index.value]))
const isFirstImage = computed(() => index.value == 0)
const isLastImage = computed(() => index.value == props.images.length - 1)
const hasMultipleImages = computed(() => props.images.length > 1)

const nextImage = () => {
  if (isLastImage.value) {
    index.value = 0
  } else {
    index.value++
  }
}
const previousImage = () => {
  if (isFirstImage.value) {
    index.value = props.images.length - 1
  } else {
    index.value--
  }
}
</script>
<template>
  <template v-if="images.length > 0">
    <img :src="currentImage" />
    <button v-if="hasMultipleImages" @click="previousImage">Previous</button>
    <button v-if="hasMultipleImages" @click="nextImage">Next</button>
  </template>
</template>
