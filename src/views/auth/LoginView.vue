<script setup lang="ts">
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
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
      <div>
        <label class="block mb-2 text-sm font-medium" for="email">Email</label>
        <input
          id="email"
          class="border border-primary text-sm rounded-lg block w-full p-2.5"
          required
          type="email"
          placeholder="Your email"
          v-model="email"
        />
      </div>
      <div>
        <label class="block mb-2 text-sm font-medium" for="password">Password</label>
        <input
          id="password"
          class="border border-primary text-sm rounded-lg block w-full p-2.5"
          required
          type="password"
          placeholder="Your password"
          v-model="password"
        />
      </div>
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
