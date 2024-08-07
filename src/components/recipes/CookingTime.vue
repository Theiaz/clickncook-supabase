<script setup lang="ts">
import { Label } from '@/components/ui/label'
import { Slider } from '@/components/ui/slider'
import { cn } from '@/util/shadcn'
import { computed } from 'vue'
import ClockIcon from '../icons/ClockIcon.vue'

const props = withDefaults(
  defineProps<{
    modelValue: number | undefined
    isReadonly?: boolean
  }>(),
  {
    isReadonly: true
  }
)
const emits = defineEmits<{
  'update:modelValue': [modelValue: number | undefined]
}>()

const cookingTime = computed({
  get() {
    return [props.modelValue!]
  },
  set(value) {
    if (!value) {
      return
    }
    emits('update:modelValue', value[0])
  }
})

const cookingTimeText = computed(() => {
  if (cookingTime.value[0] === undefined) {
    return '-'
  }
  return cookingTime.value[0] > 180 ? `180+` : `${cookingTime.value[0]}`
})
</script>
<template>
  <div v-if="isReadonly" class="flex items-center gap-2">
    <ClockIcon />
    <span>{{ cookingTimeText }} min</span>
  </div>
  <div v-else class="grid w-full max-w-sm items-center gap-1.5">
    <Label for="cookingtime">Cooking Time</Label>
    <Slider
      v-model="cookingTime"
      :min="5"
      :max="185"
      :step="5"
      :class="cn('w-3/5', $attrs.class ?? '')"
    />

    <span>{{ cookingTimeText }} min</span>
  </div>
</template>
