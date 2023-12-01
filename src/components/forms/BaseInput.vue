<script setup lang="ts">
const props = defineProps<{
  label: string
  type: 'text' | 'email' | 'password' | 'number'
  modelValue: string | number | undefined | null
}>()
defineEmits(['update:modelValue'])
</script>
<template>
  <label class="block mb-2 text-sm font-medium"
    >{{ props.label }}
    <input
      class="border border-primary text-sm rounded-lg block w-full p-2.5"
      v-bind="$attrs"
      :type="props.type"
      :value="modelValue"
      @input="$emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    />
  </label>
</template>
