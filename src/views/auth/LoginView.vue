<script setup lang="ts">
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import BaseInput from '@/components/forms/BaseInput.vue'
import { useAuth } from '@/composables/useAuth'
import BaseLayout from '@/layouts/BaseLayout.vue'
import { computed, ref } from 'vue'

const { login, loading } = useAuth()

const email = ref<string>('')
const password = ref<string>('')

const submitText = computed<string>(() => {
  return loading.value ? 'Loading' : 'Login'
})
</script>

<template>
  <BaseLayout>
    <form @submit.prevent="login(email, password)" class="flex flex-col gap-4">
      <BaseInput type="email" label="Email" v-model="email" />
      <BaseInput type="password" label="Password" v-model="password" />
      <div class="flex gap-4">
        <router-link
          class="rounded-full px-4 py-2 text-white bg-secondary"
          :to="{ name: 'register' }"
          >Register</router-link
        >
        <PrimaryButton>{{ submitText }}</PrimaryButton>
      </div>
    </form>
  </BaseLayout>
</template>
