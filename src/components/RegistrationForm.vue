<script setup lang="ts">
import { ref } from 'vue'
import { supabase } from '../supabase'

const loading = ref<boolean>(false)
const email = ref<string>('')
const password = ref<string>('')

const register = async () => {
  try {
    loading.value = true
    const { data, error } = await supabase.auth.signUp({
      email: email.value,
      password: password.value
    })
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
  <form @submit.prevent="register">
    <div>
      <input required type="email" placeholder="Your email" v-model="email" />
    </div>
    <div>
      <input required type="password" placeholder="Your password" v-model="password" />
    </div>
    <div>
      <input
        type="submit"
        :value="loading ? 'Loading' : 'Submit registration'"
        :disabled="loading"
      />
    </div>
  </form>
</template>
