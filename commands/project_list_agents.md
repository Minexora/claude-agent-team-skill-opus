# /project:list-agents — Aktif Ajanları Listele

**Kullanım:** Hangi ajanların aktif olduğunu görmek için  
**Syntax:** `/project:list-agents`  
**Sıklık:** İsteğe bağlı

---

## Fonksiyonu

Komut çalıştığında:

1. **Açık Panelleri Kontrol Eder**
   - iTerm2'deki 6 panel'in durumunu okur
   - Her panel için bootstrap'ın yüklü olup olmadığını kontrol eder

2. **Ajan Listesi Oluşturur**
   ```
   🤖 AKTIF AJANLAR — 22 Nisan 2026, 14:30
   
   ✅ Panel 1 (Sol):     Team Lead (bootstrap yüklü)
   ✅ Panel 2 (Sağ-1):   Product Owner (bootstrap yüklü)
   ✅ Panel 3 (Sağ-2):   UI/UX Designer (bootstrap yüklü)
   ✅ Panel 4 (Sağ-3):   Frontend Developer (bootstrap yüklü)
   ✅ Panel 5 (Sağ-4):   Backend Developer (bootstrap yüklü)
   ✅ Panel 6 (Sağ-5):   QA Engineer (bootstrap yüklü)
   
   Toplam: 6/6 ajan aktif ✅
   ```

3. **Panel Bilgisi Gösterir**
   - Son 5 satır output
   - CPU/memory kullanımı
   - Bootstrap status

---

## Örnek Çıktı

```
🤖 AKTIF AJANLAR RAPORU
═════════════════════════════════════════════════════

Panel Detayları:
─────────────────────────────────────────────────────

1️⃣ TEAM LEAD (Sol Panel)
   Status:       ✅ Aktif
   Bootstrap:    ✅ bootstrap_team_leader.md yüklü
   Son Output:   "Projeyi başladığım 14:15'te"
   CPU:          Düşük
   Task:         INBOX yazıyor

2️⃣ PRODUCT OWNER (Sağ-1)
   Status:       ✅ Aktif
   Bootstrap:    ✅ bootstrap_product_owner.md yüklü
   Son Output:   "User story'leri tamamladım"
   CPU:          Normal
   Task:         OUTBOX rapor yazıyor

3️⃣ UI/UX DESIGNER (Sağ-2)
   Status:       ✅ Aktif
   Bootstrap:    ✅ bootstrap_ui_ux_designer.md yüklü
   Son Output:   "Design system dosya oluşturdum"
   CPU:          Orta
   Task:         CSS yazıyor

4️⃣ FRONTEND DEVELOPER (Sağ-3)
   Status:       ✅ Aktif
   Bootstrap:    ✅ bootstrap_frontend_developer.md yüklü
   Son Output:   "Components klasöründe component.vue oluşturdum"
   CPU:          Yüksek (Vite build running)
   Task:         Component yazıyor

5️⃣ BACKEND DEVELOPER (Sağ-4)
   Status:       ✅ Aktif
   Bootstrap:    ✅ bootstrap_backend_developer.md yüklü
   Son Output:   "Django models.py hazır"
   CPU:          Orta
   Task:         Model yazıyor

6️⃣ QA ENGINEER (Sağ-5)
   Status:       ✅ Aktif
   Bootstrap:    ✅ bootstrap_qa_engineer.md yüklü
   Son Output:   "Test framework setup başlayacağım"
   CPU:          Düşük
   Task:         Standby (kodu bekliyor)

═════════════════════════════════════════════════════

📊 ÖZET:
├─ Toplam Paneller:    6/6 ✅
├─ Aktif Ajanlar:      6/6 ✅
├─ Bootstrap Yüklü:    6/6 ✅
├─ Darboğaz:           ❌ Yok
└─ Sistem Durumu:      🟢 Sağlıklı

⚡ PANEL GEÇİŞ:
/project:activate team-lead    → Sol panel'e git
/project:activate po           → PO panel'ine git
/project:activate uiux         → UI/UX panel'ine git
/project:activate frontend     → Frontend panel'ine git
/project:activate backend      → Backend panel'ine git
/project:activate qa           → QA panel'ine git
```

---

## Eğer Ajan Offline Görünürse

### ⚠️ Panel Açılmadıysa
```
❌ Panel 4 (Frontend) OFFLINE

Çözüm:
1. Panel'e manuel bağlan: /project:activate frontend
2. Bootstrap dosyasını yeniden yükle: source prompts/bootstrap_frontend_developer.md
3. setup_iterm2.sh dosyasında Frontend panel kısmı düzenle
```

### ⚠️ Bootstrap Yüklü Değilse
```
⚠️ Panel 5 (Backend) Aktif ama Bootstrap YÜKLÜ DEĞİL

Çözüm:
1. Backend panel'ine bağlan
2. Manu bootstrap yükle: 
   source /path/to/prompts/bootstrap_backend_developer.md
```

### ⚠️ CPU Çok Yüksekse
```
🔴 Panel 3 (Frontend) — CPU %95

Sorun: Vite dev server sorun mu, yoksa build mi?

Çözüm:
1. Panel'e bağlan ve Ctrl+C ile durdur
2. npm run dev'i tekrar başlat
```

---

## İlgili Komutlar

- [`/project:activate <rol>`](./project_activate.md) — Rola bağlan
- [`/project:team-status`](./project_team_status.md) — Takım durumu
- [`/project:start-team`](./project_start_team.md) — Ekip başlat

---

**Status:** Ajan yönetimi ✅  
**Referans:** [CLAUDE.md - Ekip Üyeleri](../CLAUDE.md#-ekip-üyeleri--bootstrap--rol)
