# /project:team-status — Takım Durum Raporu

**Kullanım:** Team Lead tarafından ekip durumunu kontrol etmek için  
**Syntax:** `/project:team-status`  
**Sıklık:** Her 1-2 saatte bir

---

## Fonksiyonu

Komut çalıştığında sistem:

1. **OUTBOX Raporlarını Okur**
   - Konum: `docs/reports/OUTBOX/`
   - Dosyalar: `po_done.md`, `frontend_done.md`, `backend_done.md`, `uiux_done.md`, `qa_done.md`

2. **Durum Tablosu Oluşturur**
   ```
   ╔═════════╤═══════════╤════════════╤════════════╗
   ║ Ajan    │ Durum     │ Tamamlanan │ Engeller   ║
   ╠═════════╪═══════════╪════════════╪════════════╣
   ║ PO      │ ✅ YAPTI  │ Backlog    │ Yok        ║
   ║ UI/UX   │ ⏳ YAPIYORUM | Design System 50% │ Yok        ║
   ║ Frontend│ ⏳ YAPIYORUM | Components 30%    │ CSS yok    ║
   ║ Backend │ ⏳ YAPIYORUM | Models 60%        │ Yok        ║
   ║ QA      │ 🟡 BEKLE  │ -          │ -          ║
   ╚═════════╧═══════════╧════════════╧════════════╝
   ```

3. **Engelleri Vurgular**
   ```
   🔴 ENGELLİ AJANLAR:
   - Backend: "API dokumentasyon eksik"
   - Frontend: "CSS yardımı gerekli"
   
   Çözüm: UI/UX ve Backend arasında sinkronizasyon yap
   ```

4. **Durum Özeti Verir**
   ```
   📊 ÖZET:
   - Tamamlanan görevler: 1/5 (PO)
   - Devam eden: 3/5
   - Bekleme: 1/5 (QA)
   - Darboğaz: Yok ✅
   - Ortalama ilerleme: 42%
   ```

---

## Örnek Çıktı

```
🤖 TAKÍM DURUM RAPORU — 22 Nisan 2026, 14:30

╔═════════════════════════════════════════════════════╗
║  AKTIF GÖREV STATÜSÜ                              ║
╠═════════════════════════════════════════════════════╣
║                                                     ║
║  📋 Product Owner                                   ║
║  ├─ Görev: "Sprint 1 User Story'leri"              ║
║  ├─ Durum: ✅ TAMAMLANDI                            ║
║  ├─ Tamamlanan: 7 user story, kabul kriterleri    ║
║  └─ Engel: Yok                                      ║
║                                                     ║
║  🎨 UI/UX Designer                                  ║
║  ├─ Görev: "Design System Oluşturma"               ║
║  ├─ Durum: ⏳ YAPIYORUM (%50)                       ║
║  ├─ Tamamlanan: Renkler, font, spacing             ║
║  ├─ Kalan: Button states, animations               ║
║  └─ Engel: Yok                                      ║
║                                                     ║
║  🖥️ Frontend Developer                              ║
║  ├─ Görev: "Temel Component'leri Yap"              ║
║  ├─ Durum: ⏳ YAPIYORUM (%30)                       ║
║  ├─ Tamamlanan: Button, Input, Card                ║
║  ├─ Kalan: Modal, Dropdown, Form                   ║
║  └─ Engel: "CSS yardımı gerekli (UI/UX ile sync)"  ║
║                                                     ║
║  ⚙️ Backend Developer                               ║
║  ├─ Görev: "Django Setup & Auth Models"            ║
║  ├─ Durum: ⏳ YAPIYORUM (%60)                       ║
║  ├─ Tamamlanan: Models, JWT auth                   ║
║  ├─ Kalan: API endpoints, validation                ║
║  └─ Engel: Yok                                      ║
║                                                     ║
║  🧪 QA Engineer                                     ║
║  ├─ Görev: "Test Framework Setup"                  ║
║  ├─ Durum: 🟡 BEKLEME                              ║
║  ├─ Sebep: Kod hazır değil henüz                   ║
║  └─ Engel: Yok, standby'de                         ║
║                                                     ║
╚═════════════════════════════════════════════════════╝

📊 ÖZET İSTATİSTİKLER:
├─ Toplam Aktif Görevler: 5
├─ Tamamlanan: 1 (PO ✅)
├─ Devam Eden: 3 (UI/UX, Frontend, Backend)
├─ Bekleme: 1 (QA)
├─ Ortalama İlerleme: 42%
├─ Darboğaz Riski: ❌ Yok
└─ Engelli: 1 (Frontend → CSS bekleniyor)

⚠️ HAREKETE GEÇ:
1. UI/UX ve Frontend arasında CSS sinkronizasyonu yap
2. Backend API dokumentasyonunu Frontend'e gönder
3. QA için test data hazırla

✅ SONRAKI KONTROL: 1 saat içinde
```

---

## Engel (Blocker) Tipi

### 🟢 Yeşil (Engel Yok)
- Görev sorunsuz ilerliyor
- Diğer ajanlarla sinkronizasyon temiz

### 🟡 Sarı (Küçük Engel)
- Bilgi bekleniyor (30 min'den az)
- Koordinasyon gerekli
- Ama bloker değil, dev çalışmaya devam edebilir

### 🔴 Kırmızı (Bloker)
- Görev yapılamıyor
- Diğer ajana bağlı
- **Team Lead hemen çözmeli**

---

## Team Lead Aksiyon

Engel bulunursa:

```
🔴 ENGELLİ: Frontend Developer

Sorun: "CSS file'ı yok, UI/UX henüz hazırlamadı"

Çözüm Seçenekleri:
1. UI/UX'ı hızlandır: 
   /project:assign-task uiux "CSS dosyaları ACIL"
   
2. Frontend'e geçici CSS ver:
   "Geçici olarak Bootstrap kullan, sonra stil güncelle"
   
3. Görevleri reorder et:
   Frontend beklerken başka görev yap
```

---

## İlgili Komutlar

- [`/project:start-team`](./project_start_team.md) — Ekibi başlat
- [`/project:assign-task`](./project_assign_task.md) — Görev ata
- [`/project:activate <rol>`](./project_activate.md) — Rola bağlan

---

**Sıklık:** Her 1-2 saatte bir ✅  
**Referans:** [CLAUDE.md - Team Lead İnisiyatif](../CLAUDE.md#-team-lead-inisiyatifi-alması-gereken-durumlar)
