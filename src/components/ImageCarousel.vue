<script setup lang="ts">
import ChevronLeftIcon from '@/components/icons/ChevronLeftIcon.vue'
import ChevronRightIcon from '@/components/icons/ChevronRightIcon.vue'
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
  <div class="relative">
    <template v-if="images.length > 0">
      <img :src="currentImage" class="aspect-video w-full object-cover" />
      <div
        v-if="hasMultipleImages"
        class="absolute top-1/2 w-full flex justify-between px-4 text-secondary"
      >
        <button class="backdrop-blur p-1 rounded-lg" @click="previousImage">
          <ChevronLeftIcon />
        </button>
        <button class="backdrop-blur p-1 rounded-lg" @click="nextImage">
          <ChevronRightIcon />
        </button>
      </div>
    </template>
    <template v-else>
      <div class="bg-neutral aspect-video w-full"></div>
    </template>
  </div>
</template>
