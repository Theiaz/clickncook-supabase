<script setup lang="ts">
import StarIcon from '@/components/icons/StarIcon.vue'
import { ref, watch } from 'vue'

const props = withDefaults(
  defineProps<{
    modelValue: number
    isReadonly?: boolean
  }>(),
  {
    isReadonly: true
  }
)

const emit = defineEmits<{
  'update:modelValue': [modelValue: number]
}>()

const currentRating = ref<number>(props.modelValue)
watch(
  () => props.modelValue,
  (newValue) => {
    currentRating.value = newValue
  }
)

const rate = (index: number) => {
  rateOnHover(index)
  emit('update:modelValue', currentRating.value)
}

const rateOnHover = (index: number) => {
  if (props.isReadonly) {
    return
  }

  if (typeof index === 'number' && index <= 5 && index > 0) {
    currentRating.value = index
  }
}
const resetHover = () => {
  currentRating.value = props.modelValue
}
</script>
<template>
  <div>
    <label v-if="!isReadonly" class="block mb-2 text-sm font-medium">Rating</label>
    <ul class="flex items-center">
      <li
        :class="{ 'cursor-pointer': !isReadonly }"
        v-for="index in 5"
        v-on="
          isReadonly
            ? {}
            : {
                click: () => rate(index),
                mouseover: () => rateOnHover(index),
                mouseleave: resetHover
              }
        "
        :key="index"
      >
        <StarIcon
          class="h-8 w-8 text-secondary"
          :class="[
            index <= currentRating ? 'fill-secondary' : 'fill-none',
            isReadonly ? '' : 'hover:fill-secondary'
          ]"
        ></StarIcon>
      </li>
    </ul>
  </div>
</template>
