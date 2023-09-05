<script setup lang="ts">
import { useAuth } from '@/composables/useAuth'
import { computed, ref } from 'vue'

const { register, loading } = useAuth()

const email = ref<string>('')
const emailConfirmation = ref<string>('')
const password = ref<string>('')
const passwordConfirmation = ref<string>('')

const submitText = computed<string>(() => {
  return loading.value ? 'Loading' : 'Submit registration'
})
</script>

<template>
  <form @submit.prevent="register(email, password)">
    <div>
      <input required type="email" placeholder="Your email" v-model="email" />
    </div>
    <div>
      <input required type="email" placeholder="Confirm email" v-model="emailConfirmation" />
    </div>
    <div>
      <input required type="password" placeholder="Your password" v-model="password" />
    </div>
    <div>
      <input
        required
        type="password"
        placeholder="Confirm password"
        v-model="passwordConfirmation"
      />
    </div>
    <div>
      <button type="submit" :disabled="loading">{{ submitText }}</button>
    </div>
  </form>
</template>
