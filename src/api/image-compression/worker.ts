const loadWasm = async () => {
  const compressor = await import('compressorjs')
  return compressor
}

onmessage = async (msg: MessageEvent<File>) => {
  const image: File = msg.data
  const compressor = await loadWasm()
  new compressor.default(image, {
    quality: 0.6,

    // The compression process is asynchronous,
    // which means you have to access the `result` in the `success` hook function.
    success(result) {
      console.log('Compressed image size: ', result.size)
      postMessage(result)
    },
    error(err) {
      console.log(err.message)
    }
  })
}
