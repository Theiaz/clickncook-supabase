<script setup lang="ts">
import BaseInput from '@/components/forms/BaseInput.vue'
import { Button } from '@/components/ui/button'
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
      <BaseInput type="email" label="Email" v-model="email" v-focus />
      <BaseInput type="password" label="Password" v-model="password" />
      <div class="flex gap-4">
        <router-link :to="{ name: 'register' }" v-slot="{ href, navigate }">
          <Button variant="secondary" :href="href" @click="navigate">Register</Button>
        </router-link>
        <Button>{{ submitText }}</Button>
      </div>
    </form>
  </BaseLayout>
</template>
