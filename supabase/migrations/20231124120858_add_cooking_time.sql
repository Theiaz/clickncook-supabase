alter table "public"."recipes" 
    alter column "rating" set not null;

alter table "public"."recipes" 
    add column "cooking_time" integer;