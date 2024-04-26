// https://gist.github.com/Joeao/240ba519b8bc9cf5090f81e173716656
// https://deno.com/blog/build-image-resizing-api

import { serve } from 'https://deno.land/std@0.173.0/http/server.ts'
import { Image } from 'https://deno.land/x/imagescript@1.3.0/mod.ts'
import { corsHeaders } from '../_shared/cors.ts'

serve(async (req: Request) => {
  // This is needed if you're planning to invoke your function from a browser
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  const payloadImage: {
    buffer: Uint8Array
    mediaType: string
  } = {
    buffer: new Uint8Array(await req.arrayBuffer()),
    mediaType: req.headers.get('Content-Type')!
  }

  // we need to keep the aspect ratio, therefore height is 0
  const modifiedImage = await _compressImage(payloadImage.buffer)
  return new Response(modifiedImage, {
    headers: { ...corsHeaders, 'Content-Type': payloadImage.mediaType }
  })
})

async function _compressImage(imageBuffer: Uint8Array) {
  const image = await Image.decode(imageBuffer)
  return image.encodeJPEG(50)
}
