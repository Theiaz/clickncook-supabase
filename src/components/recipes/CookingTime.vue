<script setup lang="ts">
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
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
  'update:modelValue': [modelValue: number]
}>()

const cookingTime = computed({
  get() {
    return props.modelValue
  },
  set(value) {
    if (!value) {
      return
    }
    emits('update:modelValue', value)
  }
})

const text = computed(() => (props.modelValue ? props.modelValue : '-'))
</script>
<template>
  <div v-if="isReadonly" class="flex items-center gap-2">
    <ClockIcon />
    <span>{{ text }} min</span>
  </div>
  <div v-else class="grid w-full max-w-sm items-center gap-1.5">
    <Label for="cookingtime">Cooking Time</Label>
    <Input id="cookingtime" type="number" v-model="cookingTime" />
  </div>
</template>
