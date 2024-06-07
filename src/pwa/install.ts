// Initialize deferredPrompt for use later to show browser install prompt.
let deferredPrompt: Event

const showInstallPromotion = (e: Event) => {
  console.log(`'beforeinstallprompt' event was fired.`, deferredPrompt)
}

const initInstall = () => {
  console.log('initInstall')

  window.addEventListener('beforeinstallprompt', (e: Event) => {
    // Prevent the mini-infobar from appearing on mobile
    e.preventDefault()
    // Stash the event so it can be triggered later.
    deferredPrompt = e
    // Update UI notify the user they can install the PWA
    showInstallPromotion(e)
  })
}

export { initInstall }
