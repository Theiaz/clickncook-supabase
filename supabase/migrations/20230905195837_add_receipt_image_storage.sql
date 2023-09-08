insert into storage.buckets
  (id, name)
values
  ('receipt_images', 'receipt_images');

CREATE POLICY "Enable Upload for receipt images" ON storage.objects FOR 
  INSERT TO authenticated 
  WITH CHECK (bucket_id = 'receipt_images');

ALTER TABLE public.receipts
  ADD COLUMN img_name text null;