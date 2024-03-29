<script setup lang="ts">
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
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
      <div class="grid w-full max-w-sm items-center gap-1.5">
        <Label for="email">Email</Label>
        <Input id="email" type="email" v-model="email" v-focus data-test="mail-input" />
      </div>
      <div class="grid w-full max-w-sm items-center gap-1.5">
        <Label for="password">Password</Label>
        <Input id="password" type="password" v-model="password" data-test="password-input" />
      </div>
      <div class="flex gap-4">
        <router-link
          :to="{ name: 'register' }"
          v-slot="{ href, navigate }"
          data-test="register-button"
        >
          <Button variant="secondary" :href="href" @click="navigate">Register</Button>
        </router-link>
        <Button>{{ submitText }}</Button>
      </div>
    </form>
  </BaseLayout>
</template>
