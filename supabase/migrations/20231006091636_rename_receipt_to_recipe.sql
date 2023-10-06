-- public table
BEGIN;
ALTER TABLE receipts RENAME TO recipes;
ALTER TABLE recipes RENAME CONSTRAINT "receipts_rls_pkey" TO "recipes_rls_pkey";
ALTER TABLE recipes RENAME CONSTRAINT "receipts_author_id_fkey" TO "recipes_author_id_fkey";
COMMIT;

-- auth policies
BEGIN;
ALTER POLICY "Authenticated user can create new receipts" ON recipes RENAME TO "Authenticated user can create new recipes";
ALTER POLICY "Users can update their own receipt" ON recipes RENAME TO "Users can update their own recipe";
COMMIT;

-- storage tables
BEGIN;
ALTER TABLE storage.objects
DROP CONSTRAINT "objects_bucketId_fkey"; 

UPDATE storage.objects
SET bucket_id = 'recipe_images'
WHERE bucket_id = 'receipt_images';

ALTER TABLE storage.objects
ADD CONSTRAINT "objects_bucketId_fkey" foreign key (bucket_id) references storage.buckets (id);
COMMIT;

BEGIN;
UPDATE storage.buckets
SET id = 'recipe_images', name= 'recipe_images'
WHERE id = 'receipt_images';
COMMIT;

-- storage policies
BEGIN;

DROP POLICY "Enable Upload for receipt images" ON storage.objects;
CREATE POLICY "Enable Upload for recipe images" 
   ON storage.objects 
   FOR INSERT 
   TO authenticated 
   WITH CHECK (bucket_id = 'recipe_images');

DROP POLICY "Public read access" ON storage.objects;
CREATE POLICY "Public read access"
   ON storage.objects
   for SELECT                              
   TO anon, authenticated                  
   USING (bucket_id = 'recipe_images');

DROP POLICY "Enable delete for receipt images" ON storage.objects;
CREATE POLICY "Enable delete for recipe images" 
   ON storage.objects
   FOR DELETE 
   TO authenticated 
   USING (bucket_id = 'recipe_images' AND auth.uid() = owner);

COMMIT;

-- database functions
BEGIN;
DROP FUNCTION IF EXISTS get_random_receipt;

create or replace function get_random_recipe()
returns setof recipes
language sql
as $$
   select * from recipes 
   order by random()
   limit 1;
$$;
COMMIT;