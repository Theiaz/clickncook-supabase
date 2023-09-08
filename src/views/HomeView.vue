<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { supabase } from '../supabase'

const name = ref<string>('')
const description = ref<string>('')
const loading = ref<boolean>(false)

onMounted(async () => {
  await getRandomReceipt()
})

const getRandomReceipt = async () => {
  try {
    loading.value = true

    console.log('get')

    let { data, error } = await supabase.rpc('get_random_receipt').maybeSingle()

    if (error) throw error

    if (data) {
      name.value = data.name!
      description.value = data.description!
    }
  } catch (error: any) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}
</script>
<template>
  <template v-if="name">
    <article v-if="name">
      <h2>{{ name }}</h2>
      <p>{{ description }}</p>
    </article>
    <button @click="getRandomReceipt">Get a new receipt</button>
  </template>
  <p v-else>There are no receipts. Start creating one!</p>
  <router-link :to="{ name: 'newReceipt' }">Create new receipt</router-link>
</template>
