ALTER TABLE public.recipes
DROP COLUMN img_name;

CREATE POLICY "Enable Update for recipe images" 
   ON storage.objects
   FOR UPDATE 
   TO authenticated 
   USING (bucket_id = 'recipe_images' AND auth.uid() = owner);