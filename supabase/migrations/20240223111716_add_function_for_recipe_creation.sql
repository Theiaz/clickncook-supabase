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
