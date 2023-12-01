<script setup lang="ts">
const props = defineProps<{
  label: string
  modelValue: string | string[] | number | undefined
}>()
defineEmits(['update:modelValue'])
</script>
<template>
  <div>
    <label class="block mb-2 text-sm font-medium"
      >{{ props.label }}
      <textarea
        class="border border-primary text-sm rounded-lg block w-full p-2.5"
        v-bind="$attrs"
        type="text"
        :value="modelValue"
        @input="$emit('update:modelValue', ($event.target as HTMLInputElement).value)"
      />
    </label>
  </div>
</template>
