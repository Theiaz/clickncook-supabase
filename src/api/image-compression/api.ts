const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

async function compressImages(images: FileList): Promise<File[]> {
  const files: File[] = []
  await Promise.all(
    [...images].map(async (image) => {
      const url = `${supabaseUrl}/functions/v1/image-compressor`
      const requestOptions = {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${supabaseAnonKey}`,
          'Content-Type': 'application/octet-stream'
        },
        body: image
      }

      try {
        const response = await fetch(url, requestOptions)

        if (response.ok) {
          const blob = await response.blob()
          const file = new File([blob], image.name, { type: blob.type })
          files.push(file)
        } else {
          console.error('Failed to upload image', image.name)
        }
      } catch (error) {
        console.error('Error uploading image: ', image.name, error)
      }
    })
  )

  return files
}

export { compressImages }
