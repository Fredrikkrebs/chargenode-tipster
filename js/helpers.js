// Hjälpfunktioner
function outcome(h,a){ if(h>a) return 'H'; if(a>h) return 'B'; return 'X'; }
function sameOutcome(pH,pA,rH,rA){ return outcome(pH,pA)===outcome(rH,rA); }
function scorePoints(pred, res){ if(!pred || res==null) return 0; if(pred.home===res.home && pred.away===res.away) return CONFIG.SCORING.EXACT; if(sameOutcome(pred.home,pred.away,res.home,res.away)) return CONFIG.SCORING.OUTCOME; return 0; }
function byPointsDesc(a,b){ if(b.points!==a.points) return b.points-a.points; if((b.exacts||0)!==(a.exacts||0)) return (b.exacts||0)-(a.exacts||0); return a.name.localeCompare(b.name); }
async function fetchJSON(path){ const res = await fetch(path+`?v=${Date.now()}`); if(!res.ok) throw new Error('Kunde inte läsa '+path); return await res.json(); }
