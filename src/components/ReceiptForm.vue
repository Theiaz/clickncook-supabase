<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { supabase } from '../supabase'

const name = ref<string>('')
const description = ref<string>('')
var loading = ref<boolean>(false)

onMounted(() => {
  getReceipt()
})

const createReceipt = async () => {
  try {
    loading.value = true
    // const { user } = session.value

    const updates = {
      id: 1,
      name: name.value,
      description: description.value
    }

    let { error } = await supabase.from('Receipt').upsert(updates)

    if (error) throw error
  } catch (error: any) {
    alert(error.message)
  } finally {
    loading.value = false
  }
}

const getReceipt = async () => {
  try {
    loading.value = true
    //const { user } = session.value

    let { data, error, status } = await supabase
      .from('Receipt')
      .select(`name, description`)
      .single()

    if (error && status !== 406) throw error

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
  <form @submit.prevent="createReceipt">
    <div>
      <label for="name">Name</label>
      <input id="name" type="text" v-model="name" />
    </div>
    <div>
      <label for="description">Description</label>
      <textarea id="description" type="text" v-model="description" />
    </div>
    <div>
      <input type="submit" :value="loading ? 'Loading ...' : 'Update'" :disabled="loading" />
    </div>
  </form>
</template>
