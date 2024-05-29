import type { Options } from 'browser-image-compression'
import imageCompression from 'browser-image-compression'

onmessage = async (msg: MessageEvent<File>) => {
  const image: File = msg.data

  const options: Options = {
    maxSizeMB: 1,
    maxWidthOrHeight: 1920,
    useWebWorker: false,
    fileType: image.type
  }
  try {
    const compressedFile: Blob = await imageCompression(image, options)
    const resizedImg = new File([compressedFile], image.name, { type: image.type })
    postMessage(resizedImg)
  } catch (error) {
    console.log(error)
  }
}
