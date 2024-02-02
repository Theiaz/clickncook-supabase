create table
  public.categories (
    id uuid not null default gen_random_uuid (),
    created_at timestamp with time zone not null default now(),
    name text not null,
    constraint categories_pkey primary key (id),
    constraint categories_name_key unique (name)
  ) tablespace pg_default;

-- index
CREATE UNIQUE INDEX index_categories_name_key ON public.categories USING btree (name);
CREATE UNIQUE INDEX index_categories_pkey ON public.categories USING btree (id);

-- policies
alter table "public"."categories" enable row level security;

-- recipe to categories
create table
  public.recipes_to_categories (
    id uuid not null default gen_random_uuid (),
    created_at timestamp with time zone not null default now(),
    recipe_id uuid null,
    category_id uuid null,
    constraint recipes_to_categories_pkey primary key (id),
    constraint recipes_to_categories_recipe_id_fkey foreign key (recipe_id) references recipes (id) on update cascade on delete cascade,
    constraint recipes_to_categories_category_id_fkey foreign key (category_id) references categories (id) on update cascade on delete cascade
  ) tablespace pg_default;

  -- policies
  alter table "public"."recipes_to_categories" enable row level security;

CREATE POLICY "Enable read access for all users" ON "public"."categories"
  AS PERMISSIVE FOR SELECT
  TO public
  USING (true)