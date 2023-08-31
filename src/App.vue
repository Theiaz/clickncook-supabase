<script setup lang="ts">
import BaseLayout from '@/layouts/BaseLayout.vue'
import { RouterView } from 'vue-router'
import { useSession } from './composables/useSession'

const { getSession } = useSession()

getSession()
</script>

<template>
  <BaseLayout>
    <RouterView />
  </BaseLayout>
</template>
