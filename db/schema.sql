-- Supabase/Postgres schema för tippning
create extension if not exists pgcrypto;

create table if not exists players (
  id uuid primary key default gen_random_uuid(),
  display_name text unique not null,
  created_at timestamptz default now()
);

create table if not exists rounds (
  id uuid primary key default gen_random_uuid(),
  round_no int not null unique,
  dates text
);

create table if not exists teams (
  id uuid primary key default gen_random_uuid(),
  name text unique not null
);

create table if not exists matches (
  id uuid primary key default gen_random_uuid(),
  round_id uuid references rounds(id) on delete cascade,
  home_team uuid references teams(id) on delete restrict,
  away_team uuid references teams(id) on delete restrict,
  result_home int,
  result_away int
);

create table if not exists picks (
  id uuid primary key default gen_random_uuid(),
  player_id uuid references players(id) on delete cascade,
  match_id uuid references matches(id) on delete cascade,
  pred_home int,
  pred_away int,
  unique(player_id, match_id)
);
