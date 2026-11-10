-- Agences gérées depuis l'admin du site
create table if not exists public.agences (
  nom        text primary key,
  created_at timestamptz not null default now()
);
alter table public.agences enable row level security;
drop policy if exists "agences lues" on public.agences;
drop policy if exists "admin agences" on public.agences;
create policy "agences lues"  on public.agences for select to authenticated using (true);
create policy "admin agences" on public.agences for all    to authenticated using (public.mon_role() = 'admin') with check (public.mon_role() = 'admin');
insert into public.agences (nom) values ('Vénissieux'), ('SP3C'), ('SMC'), ('Dampierre') on conflict do nothing;
