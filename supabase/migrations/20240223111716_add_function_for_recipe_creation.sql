-- create recipes with related categories
CREATE OR REPLACE FUNCTION create_recipe(
    recipe_data public.recipes, -- TODO this type is unknown in the frontend
    category_ids uuid[]
)
RETURNS json AS $$
DECLARE
    recipe_id uuid;
    category_id uuid;
    recipe_json json;
BEGIN

    -- Insert the recipe into the recipes table
    -- TODO schaefer - can we derive the columns so we dont have to adjust this function every time a new column has been added? 
    INSERT INTO public.recipes (name, description, author_id, rating, cooking_time)
    VALUES (recipe_data.name, recipe_data.description, recipe_data.author_id, recipe_data.rating, recipe_data.cooking_time)
    RETURNING id INTO recipe_id;

    -- Insert the categories for the recipe
    FOREACH category_id IN ARRAY category_ids
    LOOP
        -- Insert a row into recipes_to_categories table
        INSERT INTO public.recipes_to_categories (recipe_id, category_id)
        VALUES (recipe_id, category_id);
    END LOOP;

    -- we need the generated id doing further operations, like storing images in the bucket
    recipe_json := json_build_object('id', recipe_id);
    return recipe_json;
END;
$$ LANGUAGE plpgsql;