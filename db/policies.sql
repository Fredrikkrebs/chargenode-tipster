-- Policies för demo (öppna). OBS! Alla med anon-nyckeln får läsa/skriva.
-- Aktivera RLS och tillåt ALLA operationer (demo). För produktion: byt till Auth-baserade policies.

alter table if exists players enable row level security;
alter table if exists rounds  enable row level security;
alter table if exists teams   enable row level security;
alter table if exists matches enable row level security;
alter table if exists picks   enable row level security;

-- Läs
create policy if not exists p_players_all_read on players for select using (true);
create policy if not exists p_rounds_all_read  on rounds  for select using (true);
create policy if not exists p_teams_all_read   on teams   for select using (true);
create policy if not exists p_matches_all_read on matches for select using (true);
create policy if not exists p_picks_all_read   on picks   for select using (true);

-- Skriv (demo)
create policy if not exists p_picks_all_write  on picks   for insert with check (true);
create policy if not exists p_picks_all_update on picks   for update using (true) with check (true);
create policy if not exists p_matches_all_upd  on matches for update using (true) with check (true);
create policy if not exists p_players_all_upsert on players for insert with check (true);
create policy if not exists p_players_all_update on players for update using (true) with check (true);
