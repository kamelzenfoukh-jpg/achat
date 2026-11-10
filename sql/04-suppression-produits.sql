-- Supprimer un produit ne casse pas les DA existantes : la ligne garde sa désignation et son prix
alter table public.lignes drop constraint if exists lignes_produit_id_fkey;
alter table public.lignes add constraint lignes_produit_id_fkey foreign key (produit_id) references public.produits(id) on delete set null;

-- L'admin peut supprimer une DA (ses lignes partent avec)
drop policy if exists "admin supprime demandes" on public.demandes;
create policy "admin supprime demandes" on public.demandes for delete to authenticated using (public.mon_role() = 'admin');
