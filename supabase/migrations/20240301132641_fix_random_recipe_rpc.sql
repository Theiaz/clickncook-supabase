CREATE TYPE category_info AS (
    id uuid,
    name text
);

CREATE TYPE recipe_with_categories AS (
    id uuid,
    name text,
    description text,
    author_id uuid,
    rating int4,
    cooking_time int4,
    categories category_info[]
);

DROP FUNCTION IF EXISTS get_random_recipe;

CREATE OR REPLACE FUNCTION get_random_recipe()
RETURNS SETOF recipe_with_categories AS $$
DECLARE
    random_recipe recipe_with_categories;
BEGIN
    SELECT
        r.id AS recipe_id,
        r.name AS recipe_name,
        r.description AS recipe_description,
        r.author_id AS recipe_author_id,
        r.rating AS recipe_rating,
        r.cooking_time AS recipe_cooking_time,
        ARRAY(
            SELECT
                ROW(c.id, c.name) 
            FROM
                public.categories c
            JOIN
                public.recipes_to_categories rtc ON c.id = rtc.category_id
            WHERE
                rtc.recipe_id = r.id
        ) AS categories
    INTO
        random_recipe
    FROM
        public.recipes r
    ORDER BY
        RANDOM()
    LIMIT 1;
    
    IF random_recipe IS NULL THEN
        RETURN;
    ELSE
        RETURN NEXT random_recipe;
    END IF;
END;
$$ LANGUAGE plpgsql;