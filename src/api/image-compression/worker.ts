const IMAGE_TYPE = 'image/webp'

onmessage = async (msg: MessageEvent<File>) => {
  const img: File = msg.data
  const imageBitmap = await createImageBitmap(img)

  const offscreenCanvas = new OffscreenCanvas(imageBitmap.width / 2, imageBitmap.height / 2)
  const ctx = offscreenCanvas.getContext('2d')
  if (ctx == null) return

  // Draw the ImageBitmap onto the OffscreenCanvas, resizing it
  ctx.drawImage(imageBitmap, 0, 0, offscreenCanvas.width, offscreenCanvas.height)
  const blob = await offscreenCanvas.convertToBlob({ type: IMAGE_TYPE })
  const resizedImg = new File([blob], img.name, { type: IMAGE_TYPE })

  postMessage(resizedImg)
}
