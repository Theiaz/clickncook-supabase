<script setup lang="ts">
import { RouterView } from 'vue-router'
import { useSession } from './composables/useSession'

const { getSession } = useSession()

getSession()
</script>

<template>
  <RouterView />
</template>
