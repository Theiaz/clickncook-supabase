// https://gist.github.com/Joeao/240ba519b8bc9cf5090f81e173716656
// https://deno.com/blog/build-image-resizing-api

import { serve } from 'https://deno.land/std@0.173.0/http/server.ts'
import {
  ImageMagick,
  initializeImageMagick,
  MagickFormat,
  MagickGeometry
} from 'https://deno.land/x/imagemagick_deno@0.0.14/mod.ts'
import { corsHeaders } from '../_shared/cors.ts'

await initializeImageMagick()

type ImageParams = { width: number; height: number; mode: string }

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
  const params: ImageParams = { width: 2000, height: 0, mode: 'fit' }
  const modifiedImage = await _modifyImage(payloadImage.buffer, params)
  return new Response(modifiedImage, {
    headers: { ...corsHeaders, 'Content-Type': 'image/webp' }
  })
})

function _modifyImage(imageBuffer: Uint8Array, params: ImageParams) {
  const sizingData = new MagickGeometry(params.width, params.height)
  sizingData.ignoreAspectRatio = params.height > 0 && params.width > 0

  return new Promise<Uint8Array>((resolve) => {
    ImageMagick.read(imageBuffer, (image) => {
      image.resize(sizingData)

      image.write((data) => {
        resolve(data)
      }, MagickFormat.Webp)
    })
  })
}

/* To invoke locally:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/image-compressor' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
