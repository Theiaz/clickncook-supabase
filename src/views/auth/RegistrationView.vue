<script setup lang="ts">
import PrimaryButton from '@/components/buttons/PrimaryButton.vue'
import BaseInput from '@/components/forms/BaseInput.vue'
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
      <BaseInput type="email" label="Email" v-model="email" v-focus />
      <BaseInput type="email" label="Confirm Email" v-model="emailConfirmation" />
      <BaseInput type="password" label="Password" v-model="password" />
      <BaseInput type="password" label="Confirm Password" v-model="passwordConfirmation" />
      <div>
        <PrimaryButton>{{ submitText }}</PrimaryButton>
      </div>
    </form>
  </BaseLayout>
</template>
