<script setup lang="ts">
import InstallIcon from '@/components/icons/InstallIcon.vue'
import Button from '@/components/ui/button/Button.vue'
import type { BeforeInstallPromptEvent } from '@/types/install'
import { useEventListener } from '@vueuse/core'
import { ref } from 'vue'

useEventListener(window, 'beforeinstallprompt', (e: BeforeInstallPromptEvent) => {
  registerInstall(e)
})

let installPrompt: BeforeInstallPromptEvent | null = null
const isInstallable = ref(false)
const registerInstall = (e: BeforeInstallPromptEvent) => {
  e.preventDefault()
  // Stash the event so it can be triggered later.
  installPrompt = e
  // Update UI notify the user they can install the PWA
  isInstallable.value = true
}

const install = async () => {
  const result = await installPrompt!.prompt()

  // reset state
  installPrompt = null
  isInstallable.value = false
}
</script>
<template>
  <Button v-show="isInstallable" id="install" variant="default" size="icon" @click="install">
    <InstallIcon />
  </Button>
</template>
