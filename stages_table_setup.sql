-- One-time setup for "+ New stage row" on The EJL Docket.
-- Run this once in the Supabase SQL editor (fmxeqvxhembejbypamap project).
-- After this runs, anyone can click "+ New stage row" in the toolbar and it
-- will show up live for everyone, the same way new steps already do.

create table if not exists public.stages (
  id text primary key,
  title text not null,
  color text,
  order_val integer not null default 0,
  added_by text,
  created_at timestamptz not null default now()
);

alter table public.stages enable row level security;

create policy "stages are publicly readable"
  on public.stages for select
  using (true);

create policy "stages are publicly insertable"
  on public.stages for insert
  with check (true);

create policy "stages are publicly updatable"
  on public.stages for update
  using (true);

alter publication supabase_realtime add table public.stages;
