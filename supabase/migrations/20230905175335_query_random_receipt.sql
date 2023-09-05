create or replace function get_random_receipt()
returns setof receipts
language sql
as $$
   select * from receipts 
   order by random()
   limit 1;
$$;