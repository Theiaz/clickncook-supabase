-- CREATE
CREATE OR REPLACE FUNCTION create_recipe(
    recipe_data public.recipes,
    category_ids uuid[]
)
RETURNS void AS $$
DECLARE
    _tmp_recipe_id uuid;
    _tmp_category_id uuid;
BEGIN
    -- insert recipes
    INSERT INTO public.recipes (name, description, author_id, rating, cooking_time)
    VALUES (recipe_data.name, recipe_data.description, recipe_data.author_id, recipe_data.rating, recipe_data.cooking_time)
    RETURNING id INTO _tmp_recipe_id;

    -- insert each category_id into public.recipes_to_categories    
    FOREACH _tmp_category_id IN ARRAY category_ids
    LOOP
        INSERT INTO public.recipes_to_categories (recipe_id, category_id)
        VALUES (_tmp_recipe_id, _tmp_category_id);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE POLICY "Allow user to insert categories for his recipe" ON "public"."recipes_to_categories"
  AS PERMISSIVE FOR INSERT
  TO authenticated
  with check (true); -- TODO check if owner of recipe with auth.uid() =

-- UPDATE
CREATE OR REPLACE FUNCTION update_recipe(
    recipe_data public.recipes,
    category_ids uuid[]
)
RETURNS void AS $$
DECLARE
    _tmp_category_id uuid;
BEGIN
    -- update recipe
    UPDATE public.recipes
    SET name = recipe_data.name,
        description = recipe_data.description,
        rating = recipe_data.rating,
        cooking_time = recipe_data.cooking_time
    WHERE id = recipe_data.id;

    -- delete existing categories for the recipe
    DELETE FROM public.recipes_to_categories
    WHERE recipe_id = recipe_data.id;

    -- insert each category_id into public.recipes_to_categories    
    FOREACH _tmp_category_id IN ARRAY category_ids
    LOOP
        INSERT INTO public.recipes_to_categories (recipe_id, category_id)
        VALUES (recipe_data.id, _tmp_category_id);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE POLICY "Allow user to update categories for his recipe" ON "public"."recipes_to_categories"
  AS PERMISSIVE FOR UPDATE
  TO authenticated
  with check (true); 

CREATE POLICY "Allow user to delete categories for his recipe" ON "public"."recipes_to_categories" 
  AS PERMISSIVE FOR DELETE 
  TO authenticated 
  USING (true);


-- CREATE POLICY "Users can update their own recipe" ON "public"."recipes" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "author_id"));