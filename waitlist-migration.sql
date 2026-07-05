create table if not exists public.waitlist (
  id uuid primary key default gen_random_uuid(),
  email text not null,
  phone text,
  pet_type text,
  created_at timestamptz not null default now()
);

alter table public.waitlist add constraint waitlist_email_unique unique (email);

alter table public.waitlist enable row level security;

create policy "Anyone can insert into waitlist"
  on public.waitlist for insert
  with check (true);

create policy "Anyone can read waitlist count"
  on public.waitlist for select
  using (true);

create index if not exists idx_waitlist_email on public.waitlist (email);
