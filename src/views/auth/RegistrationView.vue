<script setup lang="ts">
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import { useAuth } from '@/composables/useAuth'
import BaseLayout from '@/layouts/BaseLayout.vue'
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
  <BaseLayout>
    <form class="flex flex-col gap-4" @submit.prevent="register(email, password)">
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
        <label class="block mb-2 text-sm font-medium" for="confirmEmail">Confirm Email</label>
        <input
          id="confirmEmail"
          class="border border-primary text-sm rounded-lg block w-full p-2.5"
          required
          type="email"
          placeholder="Confirm email"
          v-model="emailConfirmation"
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
      <div>
        <label class="block mb-2 text-sm font-medium" for="confirmPassword">Confirm Password</label>
        <input
          id="confirmPassword"
          class="border border-primary text-sm rounded-lg block w-full p-2.5"
          required
          type="password"
          placeholder="Confirm password"
          v-model="passwordConfirmation"
        />
      </div>
      <div>
        <PrimaryButton>{{ submitText }}</PrimaryButton>
      </div>
    </form>
  </BaseLayout>
</template>
