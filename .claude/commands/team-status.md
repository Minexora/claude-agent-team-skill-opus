# /project:team-status

## Purpose
Takımın mevcut durumunu özetler: atanan görevler (INBOX), tamamlanan işler (OUTBOX) ve varsa blocker'lar.

## Input
- Opsiyonel parametreler:
	- `--full`: Detaylı rapor (tüm dosya içerikleri)
	- `--blockers`: Sadece blocker'ları listeler

## Behavior
1. `docs/reports/INBOX/` altındaki tüm `*_task.md` dosyalarını tarar ve her rolün şu bilgilerini çıkarır:
	 - Atanan görev başlığı
	 - Öncelik
	 - Kısaca kabul kriterleri
2. `docs/reports/OUTBOX/` altındaki tüm `*_done.md` dosyalarını tarar ve tamamlanan öğeleri listeler.
3. Her rol için birleştirilmiş durum tablosu oluşturur:

| Rol | INBOX Durumu | OUTBOX Durumu | Blocker |
|-----|--------------|---------------|--------|
| Frontend | Login ekranı (Yüksek) | - | Backend `/auth` eksik |

4. Eğer `--blockers` verilmişse, yalnızca blocker satırlarını kullanıcıya sunar ve öneri ister.

5. Eğer `--full` verilmişse, her görevin tam markdown içeriğini gösterir.

## Output
- Konsol veya sohbet üzerinde tablo formatında özet.
- Eğer blocker varsa, kullanıcıya hangi kararların gerektiğini bildirir.

---

**Komut:** `/project:team-status`  
**Durum:** Production  
**Son Güncelleme:** 21 Nisan 2026
