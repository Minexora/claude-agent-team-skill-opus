# /project:start-team

## Purpose
Yeni bir yazılım projesini sıfırdan başlatır. Klasör yapısını oluşturur, iTerm2 üzerinde 6'lı takım panelini açar ve bootstrap promptlarını her ajana iletir.

Takım Lead olarak şu işlemleri yapar:
1. Kullanıcıdan proje gereksinimlerini toplar
2. `scripts/setup_project.sh` ile proje klasörünü oluşturur
3. `scripts/setup_iterm2.sh` ile 6 paneli iTerm2'de açar
4. Bootstrap promptlarını (`prompts/bootstrap_*.md`) tüm ajanların paneline gönderir
5. İlk sprint görevlerini `docs/reports/INBOX/` klasörüne yazıp ekibe dağıtır

---

## Input

### Kullanıcıdan Alınacak (Minimum 3 Soru)

1. **Proje Adı** (string)
   - Örn: "E-Commerce Platform", "IoT Dashboard"

2. **Frontend Framework** (opsiyonel, default: Vue 3)
   - Seçenekler: Vue 3, React
   - Varsayılan: Vue 3

3. **Backend Framework** (opsiyonel, default: Django)
   - Seçenekler: Django, FastAPI, Node.js
   - Varsayılan: Django

4. **Database** (opsiyonel, default: PostgreSQL)
   - Seçenekler: PostgreSQL, MySQL, MongoDB
   - Varsayılan: PostgreSQL

**KURAL:** 4. sorudan sonra başka soru SORMA. Geri kalanını oto-setleme veya default values kullan.

---

## Behavior

### 1. Gereksinim Toplama
```
Soru: "Proje adı nedir?"
  → Cevap alıncaya kadar bekle
  
Soru: "Frontend: Vue 3 + Backend: Django + Database: PostgreSQL uygun mu?"
  → Evet/Hayır cevabı alıncaya kadar bekle
```

### 2. Proje Klasörü Oluştur
```bash
chmod +x scripts/setup_project.sh
./scripts/setup_project.sh --name "<proje-adı>" \
                           --frontend vue3 \
                           --backend django \
                           --database postgresql
```

Sonuç: `<proje-adı>/` klasörü tam yapıyla oluşturulur:
```
<proje-adı>/
├── docs/
│   ├── project_plan.md
│   ├── requirements/
│   ├── design/
│   └── reports/
│       ├── INBOX/
│       └── OUTBOX/
├── frontend/
├── backend/
├── tests/
└── scripts/
```

### 3. iTerm2 Panellerini Aç
```bash
chmod +x scripts/setup_iterm2.sh
./scripts/setup_iterm2.sh --project "<proje-adı>"
```

Sonuç: 6 panel açılır:
- **Panel 1:** Team Lead (sen)
- **Panel 2:** Product Owner (PO)
- **Panel 3:** Frontend Developer
- **Panel 4:** Backend Developer
- **Panel 5:** UI/UX Designer
- **Panel 6:** QA Engineer

### 4. Bootstrap Promptlarını Gönder
Her panel başladığında şu dosyalardan promplar yüklenir:
- `prompts/bootstrap_team_leader.md` → Panel 1
- `prompts/bootstrap_product_owner.md` → Panel 2
- `prompts/bootstrap_frontend_developer.md` → Panel 3
- `prompts/bootstrap_backend_developer.md` → Panel 4
- `prompts/bootstrap_ui_ux_designer.md` → Panel 5
- `prompts/bootstrap_qa_engineer.md` → Panel 6

### 5. İlk Görevleri At
`docs/project_plan.md` oluştur:
```markdown
# 📊 Proje Planı: <Proje Adı>

**Başlama Tarihi:** [Tarih]
**Stack:** Vue 3 + Django + PostgreSQL
**Hedef:** [Kullanıcı hedefi]

## Teknoloji
- Frontend: Vue 3 (Vite, Pinia)
- Backend: Django REST Framework
- Database: PostgreSQL
```

Her rol için ilk görev `docs/reports/INBOX/<rol>_task.md`:
```markdown
## 📋 Görev: Proje Başlangıcı
**Atayan:** Team Lead
**Tarih:** [Tarih]
**Öncelik:** Yüksek

### Açıklama
Proje başlatıldı. Lütfen kendi panelinin talimatlarını (bootstrap) oku ve hazır ol.

### Kabul Kriterleri
- [ ] Bootstrap talimatlarını okudum
- [ ] Panel kurulumumu tamamladım
- [ ] İlk görevimi almaya hazırım

### Notlar
Takım yapısını öğrenmen için lütfen: [CLAUDE.md](../../../CLAUDE.md) > Ekip Üyeleri bölümü
```

### 6. Bildirim
```
✅ Takım başarıyla kuruldu!
📍 Proje klasörü: <proje-adı>/
📊 Plan dosyası: docs/project_plan.md
👥 6 panel iTerm2'de açıldı (Team Lead + 5 Ajan)
📥 İlk görevler INBOX'a yazıldı

Sonraki adım: /project:assign-task ile görevleri düzenle
```

---

## Output

### Oluşturulan Kaynaklar

1. **Klasör Yapısı**
   - `<proje-adı>/` tüm alt klasörler
   - `docs/project_plan.md` planı

2. **İlk Görevler**
   - `docs/reports/INBOX/po_task.md`
   - `docs/reports/INBOX/frontend_task.md`
   - `docs/reports/INBOX/backend_task.md`
   - `docs/reports/INBOX/uiux_task.md`
   - `docs/reports/INBOX/qa_task.md`

3. **Açık Paneller**
   - 6 adet iTerm2 panel (sırayla Team Lead, PO, Frontend, Backend, UI/UX, QA)
   - Her panelde bootstrap prompt yüklenmiş

4. **Durum**
   - Team Lead: "Takım hazır, görev atamaya başla"
   - Diğer Ajanlar: "Bootstrap talimatlarını okuduk, işe hazırız"

---

**Komut:** `/project:start-team`  
**Başlama Komutu:** `Team Lead:` "takım oluştur" veya "start team"  
**Durum:** Production  
**Son Güncelleme:** 21 Nisan 2026
