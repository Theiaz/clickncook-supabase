<script setup lang="ts">
import ReceiptEdit from '@/components/ReceiptEdit.vue'
import ReceiptReadonly from '@/components/ReceiptReadonly.vue'
import { useUser } from '@/composables/useUser'
import { useReceiptStore } from '@/stores/receipt'
import { storeToRefs } from 'pinia'
import { computed, onBeforeMount, ref } from 'vue'

const props = defineProps<{
  id: string
}>()

const receiptStore = useReceiptStore()
const { receipt } = storeToRefs(receiptStore)

const { user } = useUser()
const isOwnReceipt = computed(() => receipt.value!.authorId === user.value?.id)
const isEditing = ref<boolean>(false)

const loading = ref<boolean>(false)
onBeforeMount(async () => {
  if (receipt.value === null || receipt.value!.id !== props.id) {
    loading.value = true
    await receiptStore.getReceiptById(props.id)
    loading.value = false
  }
})
</script>
<template>
  <section :aria-buy="loading">
    <template v-if="receipt">
      <label for="switch-1" v-if="isOwnReceipt">
        <input type="checkbox" id="switch-1" name="switch-1" role="switch" v-model="isEditing" />
        Edit receipt
      </label>
      <ReceiptEdit v-if="isEditing" :receipt="receipt!" />
      <ReceiptReadonly v-else :receipt="receipt!" />
    </template>
    <p v-else>Something went wrong! Please try to reload this page.</p>
  </section>
</template>
