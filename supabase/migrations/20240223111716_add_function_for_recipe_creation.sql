-- CREATE
CREATE TYPE category_info AS (
    id uuid,
    name text,
    created_at timestamptz
);

CREATE TYPE recipe_with_categories AS (
    id uuid,
    name text,
    description text,
    author_id uuid,
    rating int4,
    cooking_time int4,
    created_at timestamptz,
    categories category_info[]
);

CREATE OR REPLACE FUNCTION create_recipe(
    recipe_data public.recipes,
    category_ids uuid[]
)
RETURNS SETOF recipe_with_categories AS $$
DECLARE
    _tmp_recipe_id uuid;
    _tmp_category_id uuid;
    created_recipe recipe_with_categories;
BEGIN
    -- insert recipe
    INSERT INTO public.recipes (name, description, author_id, rating, cooking_time)
    VALUES (recipe_data.name, recipe_data.description, recipe_data.author_id, recipe_data.rating, recipe_data.cooking_time)
    RETURNING id INTO _tmp_recipe_id;

    -- insert each category_id into public.recipes_to_categories    
    FOREACH _tmp_category_id IN ARRAY category_ids
    LOOP
        INSERT INTO public.recipes_to_categories (recipe_id, category_id)
        VALUES (_tmp_recipe_id, _tmp_category_id);
    END LOOP;

    SELECT
        r.id AS recipe_id,
        r.name AS recipe_name,
        r.description AS recipe_description,
        r.author_id AS recipe_author_id,
        r.rating AS recipe_rating,
        r.cooking_time AS recipe_cooking_time,
        r.created_at AS recipe_created_at,
        ARRAY(
            SELECT ROW(c.id, c.name, c.created_at) 
            FROM public.categories c
            JOIN public.recipes_to_categories rtc ON c.id = rtc.category_id
            WHERE rtc.recipe_id = r.id
        ) AS categories
    INTO created_recipe
    FROM public.recipes r
    WHERE r.id = _tmp_recipe_id;

    IF created_recipe IS NULL THEN
        RETURN;
    ELSE
        RETURN NEXT created_recipe;
    END IF;
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