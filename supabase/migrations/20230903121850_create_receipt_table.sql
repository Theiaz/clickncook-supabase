create table
  public.receipts (
    created_at timestamp with time zone null default now(),
    name text null,
    description text null,
    author_id uuid null,
    id uuid not null default gen_random_uuid (),
    constraint receipts_rls_pkey primary key (id),
    constraint receipts_author_id_fkey foreign key (author_id) references auth.users (id) on delete cascade
  ) tablespace pg_default;
  
alter table "public"."receipts" enable row level security;

create policy "Authenticated user can create new receipts"
    on "public"."receipts"
    as permissive
    for insert
    to authenticated
    with check (true);

create policy "Users can update their own receipt."
    on "public"."receipts" 
    for update
    using ( auth.uid() = id );