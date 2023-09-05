<script setup lang="ts">
import { useAuth } from '@/composables/useAuth'
import { computed, ref } from 'vue'

const { login, loading } = useAuth()

const email = ref<string>('')
const password = ref<string>('')

const submitText = computed<string>(() => {
  return loading.value ? 'Loading' : 'Login'
})
</script>

<template>
  <form @submit.prevent="login(email, password)">
    <div>
      <input required type="email" placeholder="Your email" v-model="email" />
    </div>
    <div>
      <input required type="password" placeholder="Your password" v-model="password" />
    </div>
    <div>
      <button type="submit" :disabled="loading">{{ submitText }}</button>
    </div>
    <div>
      <router-link :to="{ name: 'register' }">Register</router-link>
    </div>
  </form>
</template>
