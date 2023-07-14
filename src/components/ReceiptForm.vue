<script setup lang="ts">
import { ref } from 'vue'

const name = ref<string>('')
const description = ref<string>('')
var loading = ref<boolean>(false)

const createReceipt = () => {}
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
