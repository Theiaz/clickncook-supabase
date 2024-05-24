import type { PhotonImage } from '@silvia-odwyer/photon'

const loadWasm = async () => {
  return await import('@silvia-odwyer/photon')
}

onmessage = async (msg: MessageEvent<File>) => {
  const photon = await loadWasm()

  const image: File = msg.data
  const imageBitmap: ImageBitmap = await createImageBitmap(image)
  const width = imageBitmap.width
  const height = imageBitmap.height

  const offscreenCanvas = new OffscreenCanvas(width, height)
  const ctx = offscreenCanvas.getContext('2d')
  if (ctx == null) return
  ctx.drawImage(imageBitmap, 0, 0, offscreenCanvas.width, offscreenCanvas.height)

  // Convert the ImageData found in the canvas to a PhotonImage (so that it can communicate with the core Rust library)
  // @ts-ignore
  const photonImage: PhotonImage = photon.open_image(offscreenCanvas, ctx)
  const resizedPhotonImage: PhotonImage = photon.resize(photonImage, width / 2, height / 2, 1)

  const blob = new Blob([resizedPhotonImage.get_bytes()])
  const compressedImage = new File([blob], image.name, { type: image.type })
  postMessage(compressedImage)
}
