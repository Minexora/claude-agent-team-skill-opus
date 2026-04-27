# /project:stop-team

## Purpose
Takımı ve açılmış panelleri kapatır, kısa bir proje kapanış raporu oluşturur ve istenirse `docs/reports/OUTBOX/` raporlarını arşivler.

---

## Input
- Opsiyonel parametre: `--archive` (arşivleme modu)

---

## Behavior
1. Tüm açık iTerm2 panellerini kapat (eğer `scripts/setup_iterm2.sh` ile açıldıysa, `scripts/teardown_iterm2.sh` çağrısını öner).
2. `docs/reports/OUTBOX/` içindeki mevcut raporları `docs/reports/OUTBOX/archive/` altına taşı (eğer `--archive` verilmişse).
3. Kapanış raporu oluştur: `docs/reports/OUTBOX/closing_report.md` içerir:
   - Proje adı
   - Başlama ve bitiş tarihleri
   - Tamamlanan işler
   - Açık kalan blocker'lar
4. Kullanıcıya onay ver: "Takım kapatıldı ve rapor oluşturuldu."

---

## Output
- `docs/reports/OUTBOX/closing_report.md` dosyası
- (Opsiyonel) `docs/reports/OUTBOX/archive/` içeriği

**Komut:** `/project:stop-team`  
**Durum:** Production  
**Son Güncelleme:** 21 Nisan 2026
