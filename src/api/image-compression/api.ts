async function compressImages(images: FileList): Promise<File[]> {
  const files: File[] = []
  if (window.Worker) {
    const myWorker = new Worker(new URL('./worker.ts', import.meta.url), { type: 'module' })

    for (const image of images) {
      myWorker.postMessage(image)

      await new Promise<void>((resolve) => {
        myWorker.onmessage = (e: MessageEvent<File>) => {
          files.push(e.data)
          resolve()
        }
      })
    }
  } else {
    console.log("Your browser doesn't support web workers.")
  }
  return files
}

export { compressImages }
