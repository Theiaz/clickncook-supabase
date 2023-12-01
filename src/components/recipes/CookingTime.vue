<script setup lang="ts">
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
  <div v-else>
    <label class="block mb-2 text-sm font-medium" for="cookingtime">Cooking Time</label>
    <input
      class="border border-primary text-sm rounded-lg block w-full p-2.5"
      id="cookingtime"
      type="number"
      v-model="cookingTime"
    />
  </div>
</template>
