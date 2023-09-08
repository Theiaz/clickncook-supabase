<script setup lang="ts">
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'
import { computed } from 'vue'

const { isAuthenticated } = useUser()
const { logout, loading } = useAuth()

const submitText = computed<string>(() => {
  return loading.value ? 'Loading' : 'Logout'
})
</script>
<template>
  <button v-if="isAuthenticated" type="submit" :disabled="loading" @click="logout">
    {{ submitText }}
  </button>
</template>
<style scoped>
button {
  max-width: fit-content;
  margin-left: auto;  
}
</style>
