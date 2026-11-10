-- Demandes de prestation (assistance technique) : formulaire libre, hors catalogue
alter table public.demandes alter column fournisseur_id drop not null;
alter table public.demandes add column if not exists type text not null default 'catalogue';
alter table public.demandes add column if not exists fournisseur_nom text;
alter table public.demandes add column if not exists n_affaire text;
alter table public.demandes add column if not exists details jsonb;

alter table public.lignes add column if not exists rubrique text;
alter table public.lignes add column if not exists date_livraison date;
alter table public.lignes add column if not exists lieu text;

-- nouveau rôle : assistance technique
alter table public.profiles drop constraint if exists profiles_role_check;
alter table public.profiles add constraint profiles_role_check check (role in ('technicien', 'n1', 'admin', 'assistance'));

-- Crée une DA de prestation. Avec un N+1 : en attente de validation. Sans N+1 : directement chez le responsable achats.
create or replace function public.creer_prestation(p jsonb)
returns bigint language plpgsql security definer set search_path = public as $$
declare
  v_n1 uuid;
  v_id bigint;
  v_jours int := (p->>'jours')::int;
  v_tj numeric := (p->>'tj')::numeric;
begin
  if auth.uid() is null then raise exception 'Non connecté'; end if;
  if coalesce(trim(p->>'fournisseur'), '') = '' then raise exception 'Fournisseur obligatoire'; end if;
  if coalesce(trim(p->>'mission'), '') = '' then raise exception 'Mission obligatoire'; end if;
  if v_jours is null or v_jours <= 0 then raise exception 'Nombre de jours invalide'; end if;
  if v_tj is null or v_tj < 0 then raise exception 'TJ invalide'; end if;

  select n1_id into v_n1 from profiles where id = auth.uid();

  insert into demandes (demandeur_id, n1_id, fournisseur_nom, agence, commentaire, statut, valide_le, type, n_affaire, details)
  values (auth.uid(), v_n1, trim(p->>'fournisseur'), p->>'localisation', nullif(trim(p->>'commentaire'), ''),
          case when v_n1 is null then 'validee' else 'attente' end,
          case when v_n1 is null then now() end,
          'prestation', nullif(trim(p->>'affaire'), ''), p)
  returning id into v_id;

  insert into lignes (demande_id, designation, qte, pu, rubrique, date_livraison, lieu)
  values (v_id,
          'STT - ' || upper(trim(p->>'mission')) || coalesce(' - ' || nullif(trim(p->>'localisation'), ''), ''),
          v_jours, v_tj,
          coalesce(nullif(trim(p->>'rubrique'), ''), 'SST-Sous traitance sur affaires'),
          nullif(p->>'date_fin', '')::date,
          nullif(trim(p->>'localisation'), ''));
  return v_id;
end $$;

revoke execute on function public.creer_prestation(jsonb) from public, anon;
grant execute on function public.creer_prestation(jsonb) to authenticated;
