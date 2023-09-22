-- database
CREATE POLICY "Enable delete for users based on user_id" ON public.receipts AS permissive
    FOR DELETE TO authenticated
    USING (auth.uid() = author_id);


-- storage
CREATE POLICY "Enable delete for receipt images" ON storage.objects
    FOR DELETE TO authenticated 
    USING (bucket_id = 'receipt_images' AND auth.uid() = owner);