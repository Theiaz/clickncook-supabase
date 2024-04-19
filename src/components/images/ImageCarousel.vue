<script setup lang="ts">
import ChevronLeftIcon from '@/components/icons/ChevronLeftIcon.vue'
import ChevronRightIcon from '@/components/icons/ChevronRightIcon.vue'
import { computed, ref, watch } from 'vue'
import Button from '../ui/button/Button.vue'

const props = defineProps<{
  images: File[]
}>()

const index = ref(0)
const currentImage = computed(() => props.images[index.value])
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

const getImagePreview = (file: File) => {
  return URL.createObjectURL(file)
}

watch(
  () => props.images.length,
  (newLength, oldLength) => {
    if (index.value == props.images.length) {
      if (newLength < oldLength && index.value > 0) {
        index.value--
      }
    }
  },
  { deep: true }
)
</script>
<template>
  <div class="relative text-white">
    <div class="relative">
      <div class="absolute top-0 z-10 w-full flex justify-end gap-4 px-6 bg-black/30 rounded-t-2xl">
        <slot name="actions" :currentImage="props.images[index]"></slot>
      </div>
    </div>
    <div class="relative">
      <img
        v-if="images.length > 0"
        :src="getImagePreview(currentImage)"
        class="image object-cover"
      />
      <div v-else class="image bg-primary flex justify-center items-center">No image yet!</div>
      <div v-if="hasMultipleImages" class="absolute top-1/2 w-full flex justify-between px-4">
        <Button variant="blur" size="icon" @click="previousImage" data-test="previous-image">
          <ChevronLeftIcon />
        </Button>
        <Button variant="blur" size="icon" @click="nextImage" data-test="next-image">
          <ChevronRightIcon />
        </Button>
      </div>
    </div>
  </div>
</template>
<style>
.image {
  @apply aspect-[3/2] max-h-64 w-full rounded-t-2xl;
}
</style>
