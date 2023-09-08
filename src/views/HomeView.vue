<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { supabase } from '../supabase'

const name = ref<string>('')
const description = ref<string>('')
const imgUrl = ref<string | null>()
const loading = ref<boolean>(false)

onMounted(async () => {
  await getRandomReceipt()
})

const getRandomReceipt = async () => {
  try {
    loading.value = true

    let { data, error } = await supabase.rpc('get_random_receipt').maybeSingle()

    if (error) throw error

    if (data) {
      name.value = data.name!
      description.value = data.description!
      getReceiptImage(data.img_name)
    }
  } catch (error: any) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

const hasImg = computed(() => imgUrl.value !== null)
const getReceiptImage = async (name: string | null) => {
  if (name === null) {
    return
  }

  const { data } = supabase.storage.from('receipt_images').getPublicUrl(name!)

  imgUrl.value = data.publicUrl
}
</script>
<template>
  <template v-if="name">
    <article v-if="name">
      <header>
        <h2>{{ name }}</h2>
        <img v-if="hasImg" :src="imgUrl!" />
      </header>
      <p>{{ description }}</p>
    </article>
    <button @click="getRandomReceipt">Get a new receipt</button>
  </template>
  <p v-else>There are no receipts. Start creating one!</p>
  <router-link :to="{ name: 'newReceipt' }">Create new receipt</router-link>
</template>
