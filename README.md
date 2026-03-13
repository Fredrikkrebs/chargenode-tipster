# Chargenode Tippning (GitHub Pages + Supabase)

En enkel tips-sida för Chargenode med:
- **Tippa** per omgång (index.html)
- **Live-tabell** (leaderboard.html)
- **Admin** för resultat (admin.html)
- **Fixtures** (data/fixtures.json)

## Poängregler
- Exakt resultat: **3 p**
- Rätt tecken (1X2): **1 p**

Justera i `js/config.js`.

---

## GitHub Pages – publicering
1. Skapa repo `chargenode-tipster` på GitHub och lägg in alla filer.
2. Gå till **Settings → Pages** → Source: *Deploy from a branch*, Branch: `main`, Folder: `/ (root)` → **Save**.
3. Efter 1–2 min får ni en Pages‑URL, t.ex. `https://<org>.github.io/chargenode-tipster/`.

> `.nojekyll` ligger med för säkerhets skull.

## Supabase – multi‑user
1. Skapa projekt på https://supabase.com
2. Kör i **SQL Editor**: `db/schema.sql` och sedan `db/policies.sql`.
3. Importera matcher: 
   - Antingen kör `db/seed.sql` i SQL‑editorn, **eller** öppna `admin.html` och klicka **Importera fixtures.json → Supabase** (kräver att `js/config.js` är ifyllt).
4. Fyll i `SUPABASE_URL` och `SUPABASE_ANON_KEY` i `js/config.js`.
5. Öppna `index.html` (tips), `admin.html` (resultat) och `leaderboard.html` (tabell).

### Säkerhet (demo)
`db/policies.sql` är öppna policies. För produktion: aktivera riktig inloggning (Microsoft/Entra ID) och byt policies till användarbaserade. Jag kan leverera färdiga policies.

### Låsning före avspark
Säg hur ni vill låsa (per match eller omgång, hur många minuter före) så implementerar jag i JS.
