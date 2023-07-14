<script setup lang="ts">
import { ref } from 'vue'
import { supabase } from '../supabase'
import { useSession } from '@/composables/useSession'

const loading = ref<boolean>(false)
const { hasSession } = useSession()

const logout = async () => {
  try {
    loading.value = true
    const { error } = await supabase.auth.signOut()
    if (error) throw error
  } catch (error) {
    if (error instanceof Error) {
      alert(error.message)
    }
  } finally {
    loading.value = false
  }
}
</script>
<template>
  <form v-if="hasSession" @submit.prevent="logout">
    <div>
      <input type="submit" :value="loading ? 'Loading' : 'Logout'" :disabled="loading" />
    </div>
  </form>
</template>
