<script setup lang="ts">
import { useUser } from '@/composables/useUser'
import { onMounted, ref } from 'vue'
import { supabase } from '../supabase'

const name = ref<string>('')
const description = ref<string>('')
const loading = ref<boolean>(false)

onMounted(async () => {
  await getReceipt()
})

const getReceipt = async () => {
  try {
    loading.value = true

    const { user } = useUser()

    const { data, error } = await supabase
      .from('receipts')
      .select('name, description')
      .limit(1)
      .single()

    if (error) throw error

    if (data) {
      name.value = data.name
      description.value = data.description
    }
  } catch (error: any) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}
</script>
<template>
  <article>
    <h2>{{ name }}</h2>
    <p>{{ description }}</p>
  </article>
  <router-link :to="{ name: 'newReceipt' }">Create new receipt</router-link>
</template>
