CREATE POLICY "Public read access"
  ON storage.objects
  for SELECT                              
  TO anon, authenticated                  
  USING (bucket_id = 'receipt_images');
