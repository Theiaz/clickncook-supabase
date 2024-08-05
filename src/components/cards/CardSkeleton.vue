<script setup lang="ts">
import BaseCard from '@/components/cards/BaseCard.vue'
import { Skeleton } from '@/components/ui/skeleton'
</script>
<template>
  <BaseCard>
    <template #header>
      <Skeleton class="h-[233px] w-full rounded-xl" />
    </template>
    <template #content>
      <div class="flex flex-col gap-4">
        <Skeleton class="h-10 w-[250px]" />
        <Skeleton class="h-8 w-[200px]" />
        <Skeleton class="h-6 w-[160px]" />
        <Skeleton class="h-16 max-h-16 w-full" />
      </div>
    </template>
  </BaseCard>
</template>
