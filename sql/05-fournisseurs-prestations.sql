-- Les fournisseurs saisis par l'assistance technique deviennent de vraies fiches fournisseurs
create or replace function public.creer_prestation(p jsonb)
returns bigint language plpgsql security definer set search_path = public as $$
declare
  v_n1 uuid;
  v_id bigint;
  v_f bigint;
  v_nom text := trim(p->>'fournisseur');
  v_jours int := (p->>'jours')::int;
  v_tj numeric := (p->>'tj')::numeric;
begin
  if auth.uid() is null then raise exception 'Non connecté'; end if;
  if coalesce(v_nom, '') = '' then raise exception 'Fournisseur obligatoire'; end if;
  if coalesce(trim(p->>'mission'), '') = '' then raise exception 'Mission obligatoire'; end if;
  if v_jours is null or v_jours <= 0 then raise exception 'Nombre de jours invalide'; end if;
  if v_tj is null or v_tj < 0 then raise exception 'TJ invalide'; end if;

  select id into v_f from fournisseurs where lower(trim(nom)) = lower(v_nom) limit 1;
  if v_f is null then
    insert into fournisseurs (nom, email) values (v_nom, nullif(trim(p->>'contact_email'), '')) returning id into v_f;
  end if;

  select n1_id into v_n1 from profiles where id = auth.uid();

  insert into demandes (demandeur_id, n1_id, fournisseur_id, fournisseur_nom, agence, commentaire, statut, valide_le, type, n_affaire, details)
  values (auth.uid(), v_n1, v_f, v_nom, p->>'localisation', nullif(trim(p->>'commentaire'), ''),
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

-- Rattrapage des demandes déjà faites
insert into public.fournisseurs (nom, email)
select distinct on (lower(trim(d.fournisseur_nom))) trim(d.fournisseur_nom), nullif(trim(d.details->>'contact_email'), '')
from public.demandes d
where d.fournisseur_id is null and coalesce(trim(d.fournisseur_nom), '') <> ''
  and not exists (select 1 from public.fournisseurs f where lower(trim(f.nom)) = lower(trim(d.fournisseur_nom)))
order by lower(trim(d.fournisseur_nom)), d.id;

update public.demandes d set fournisseur_id = f.id
from public.fournisseurs f
where d.fournisseur_id is null and lower(trim(f.nom)) = lower(trim(d.fournisseur_nom));
