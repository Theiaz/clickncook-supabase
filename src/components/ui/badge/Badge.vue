<!-- eslint-disable vue/multi-word-component-names -->
<script setup lang="ts">
import { cn } from '@/util/shadcn'
import type { VariantProps } from 'class-variance-authority'
import { badgeVariants } from '.'

interface BadgeVariantProps extends VariantProps<typeof badgeVariants> {}

interface Props {
  variant?: BadgeVariantProps['variant']
}
defineProps<Props>()
</script>

<template>
  <div :class="cn(badgeVariants({ variant }), $attrs.class ?? '')">
    <slot />
  </div>
</template>
