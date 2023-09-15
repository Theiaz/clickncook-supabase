<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useUser } from '@/composables/useUser'
import { supabase } from '@/supabase'
import type { ReceiptDAO } from '@/types/receipt'
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'

const name = ref<string>('')
const description = ref<string>('')
const imgName = ref<string | null>(null)
const loading = ref<boolean>(false)

const { user } = useUser()
const router = useRouter()

const createReceipt = async () => {
  try {
    loading.value = true

    const receipt: Omit<ReceiptDAO, 'id' | 'created_at'> = {
      name: name.value,
      description: description.value,
      author_id: user.value!.id,
      img_name: imgName.value
    }

    let { error } = await supabase.from('receipts').insert(receipt)

    if (error) throw error

    await router.push({ name: 'home' })
  } catch (error: any) {
    alert(error.message)
    loading.value = false
  }
}

const loadingText = computed(() => (loading.value ? 'Loading ...' : 'Create Receipt'))
</script>
<template>
  <form @submit.prevent="createReceipt">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="name" />
    </div>
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="description" />
    </div>
    <ImageUpload v-model="imgName" />
    <div>
      <button type="submit" :aria-busy="loading">{{ loadingText }}</button>
    </div>
  </form>
</template>
