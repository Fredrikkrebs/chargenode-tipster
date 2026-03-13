// Initiera Supabase-klient (kräver CDN-skriptet @supabase/supabase-js)
let SUPA = null;
function hasSupabase(){ return CONFIG.SUPABASE_URL && CONFIG.SUPABASE_ANON_KEY; }
function ensureSupabase(){ if(!hasSupabase()) return null; if(!window.supabase){ console.warn('Supabase JS saknas'); return null; } if(!SUPA){ SUPA = window.supabase.createClient(CONFIG.SUPABASE_URL, CONFIG.SUPABASE_ANON_KEY); } return SUPA; }
