<script setup lang="ts">
import InstallIcon from '@/components/icons/InstallIcon.vue'
import Button from '@/components/ui/button/Button.vue'
import type { BeforeInstallPromptEvent } from '@/types/install'
import { useEventListener } from '@vueuse/core'
import { ref, type Ref } from 'vue'

const installPrompt: Ref<BeforeInstallPromptEvent | null> = ref(null)
const isInstallable = ref(false)
const hasBeforeInstallPromptEvent = ref(false)

if ('BeforeInstallPromptEvent' in window) {
  hasBeforeInstallPromptEvent.value = true
  useEventListener(window, 'beforeinstallprompt', (e: BeforeInstallPromptEvent) => {
    registerInstallPrompt(e)
  })
  useEventListener(window, 'appinstalled', () => {
    isInstallable.value = false
  })
}

const registerInstallPrompt = (e: BeforeInstallPromptEvent) => {
  e.preventDefault()
  // Stash the event so it can be triggered later.
  installPrompt.value = e
  // Update UI notify the user they can install the PWA
  isInstallable.value = true
}

const triggerInstall = async () => {
  if (hasBeforeInstallPromptEvent.value) {
    const result = await installPrompt.value!.prompt()

    // disable install prompt
    installPrompt.value = null
  } else {
    // we won't do anything here, cause some browser can install the app and some not
    // therefore, user agent sniffing is needed to distinguish between the two categories
    // and provide custom instructions for each
  }
}
</script>
<template>
  <Button v-show="isInstallable" id="install" variant="default" size="icon" @click="triggerInstall">
    <InstallIcon />
  </Button>
</template>
