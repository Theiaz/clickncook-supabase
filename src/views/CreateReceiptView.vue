<script setup lang="ts">
import ImageUpload from '@/components/ImageUpload.vue'
import { useUser } from '@/composables/useUser'
import { supabase } from '@/supabase'
import { ref } from 'vue'

const name = ref<string>('')
const description = ref<string>('')
const imgName = ref<string | null>(null)
const loading = ref<boolean>(false)

const { user } = useUser()

const createReceipt = async () => {
  try {
    loading.value = true

    const receipt = {
      name: name.value,
      description: description.value,
      author_id: user.value?.id,
      img_name: imgName.value
    }

    let { error } = await supabase.from('receipts').insert(receipt)

    if (error) throw error
  } catch (error: any) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}
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
      <input
        type="submit"
        :value="loading ? 'Loading ...' : 'Create receipt'"
        :disabled="loading"
      />
    </div>
  </form>
</template>
