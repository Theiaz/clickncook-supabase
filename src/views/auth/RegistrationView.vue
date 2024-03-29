<script setup lang="ts">
import { Button } from '@/components/ui/button/'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
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
      <div class="grid w-full max-w-sm items-center gap-1.5">
        <Label for="email">Email</Label>
        <Input id="email" type="email" v-model="email" v-focus data-test="email-input" />
      </div>
      <div class="grid w-full max-w-sm items-center gap-1.5">
        <Label for="confirm-email">Confirm Email</Label>
        <Input
          id="confirm-email"
          type="email"
          v-model="emailConfirmation"
          data-test="email-confirm-input"
        />
      </div>
      <div class="grid w-full max-w-sm items-center gap-1.5">
        <Label for="password">Password</Label>
        <Input id="password" type="password" v-model="password" data-test="password-input" />
      </div>
      <div class="grid w-full max-w-sm items-center gap-1.5">
        <Label for="confirm-password">Confirm Password</Label>
        <Input
          id="confirm-password"
          type="password"
          v-model="passwordConfirmation"
          data-test="password-confirm-input"
        />
      </div>
      <div>
        <Button data-test="submit-button">{{ submitText }}</Button>
      </div>
    </form>
  </BaseLayout>
</template>
