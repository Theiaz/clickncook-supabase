const loadCompressionLib = async () => {
  const { default: imageCompression } = await import('browser-image-compression')
  return imageCompression
}

onmessage = async (msg: MessageEvent<File>) => {
  const image: File = msg.data
  const imageCompression = await loadCompressionLib()

  const options = {
    maxSizeMB: 1,
    maxWidthOrHeight: 1920,
    useWebWorker: false
  }
  try {
    const compressedFile = await imageCompression(image, options)
    postMessage(compressedFile)
  } catch (error) {
    console.log(error)
  }
}
