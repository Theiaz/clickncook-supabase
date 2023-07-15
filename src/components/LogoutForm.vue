<script setup lang="ts">
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'
import { computed } from 'vue'

const { hasSession } = useUser()
const { logout, loading } = useAuth()

const submitText = computed<string>(() => {
  return loading.value ? 'Loading' : 'Logout'
})
</script>
<template>
  <form v-if="hasSession" @submit.prevent="logout">
    <div>
      <button type="submit" :disabled="loading">{{ submitText }}</button>
    </div>
  </form>
</template>
