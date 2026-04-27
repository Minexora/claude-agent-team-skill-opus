# 🤖 Claude Agent Team Skill — Panel Tabanlı Çoklu-Ajan Ekibi

> **Paralel Çalışan 6-Kişi Yazılım Ekibi** — Team Lead sol panelde koordine eder, 5 ajan sağ tarafta bağımsız çalışır.  
> Hızlı Başlangıç: Proje adı → 30 saniye setup → ekip çalışıyor

---

## 🎯 Mimari — Panel Tabanlı Yapı

```
┌─────────────────────────────────────────────────────────────┐
│  iTerm2 / Terminal Grid (6 Panel)                           │
├──────────────────┬────────────────────────────────────────┤
│   TEAM LEAD      │  Sağ Taraf (Paralel 5 Ajan)           │
│   (Sol)          ├────────────────────────────────────────┤
│                  │ PO  │ UI/UX   │ Frontend  │ Backend │ QA │
│  Koordinatör     ├─────┼─────────┼───────────┼─────────┼────┤
│  • Kullanıcı     │     │         │           │         │    │
│  • INBOX yazma   │     │   5 ajan (bağımsız çalışır)   │    │
│  • OUTBOX oku    │     │                               │    │
│  • Rapor         │     │                               │    │
│                  │     │                               │    │
└──────────────────┴────────────────────────────────────────┘
```

| Parça | Rol | Aktivite |
|-------|-----|----------|
| **Team Lead (Sol)** | Koordinatör + Kullanıcı Arayüzü | INBOX yazma, OUTBOX okuma, status raporlama |
| **5 Ajan (Sağ)** | Bağımsız Çalışanlar | Görevleri çekme, çalışma, rapor yazma |
| **İletişim** | Dosya Tabanlı (INBOX/OUTBOX) + Slash Komutlar | Senkron, 3-5 saniye delay |
| **Hız** | Setup + Bootstrap | 30 saniye, gereksiz soru yok |
| **Darboğaz** | YATAY PARALEL ÇALIŞMA | Her ajan kendi işinde bağımsız |

---

## 👥 Ekip Üyeleri — Bootstrap & Rol

### 🎖️ Team Lead (Sol Panel)
**Kimsin:** 10+ yıl, lider yazılım mühendisi, proje yöneticisi  

**Bootstrap:** `prompts/bootstrap_team_leader.md`  
**Görevleri:**
- ✅ Kullanıcı gereksinimlerini 3-5 soruyla topla
- ✅ `setup_project.sh` çalıştır (klasör yapısı)
- ✅ `setup_iterm2.sh` çalıştır (6 panel + bootstrap)
- ✅ `docs/project_plan.md` yaz (proje tanımı)
- ✅ İlk görevleri `docs/reports/INBOX/` yaz
- ✅ OUTBOX raporlarını günlük oku ve durum raporla

**Yazabilir:** `docs/` (tüm)  
**Okuyabilir:** Tüm klasörler  
**Darboğaz OLMAZ:** Diğer ajanlar bağımsız çalışır

---

### 📋 Product Owner (Sağ Üst — Panel 1)
**Kimsin:** 10+ yıl, Agile/Scrum uzmanı  

**Bootstrap:** `prompts/bootstrap_product_owner.md`  
**Görevleri:**
- ✅ Backlog yazma, user story
- ✅ Acceptance criteria belirleme
- ✅ Sprint planning, prioritization

**Yazabilir:** `docs/requirements/`  
**OUTBOX Raporu:** `docs/reports/OUTBOX/po_done.md`  
**Bash Başlatması:**
```bash
/project:activate po
```

---

### 🎨 UI/UX Designer (Sağ Üst+1 — Panel 2)
**Kimsin:** 10+ yıl, Figma + modern web design  

**Bootstrap:** `prompts/bootstrap_ui_ux_designer.md`  
**Görevleri:**
- ✅ Design system, renkler, font, spacing
- ✅ Component guideline
- ✅ CSS/SCSS yazma

**Yazabilir:** `frontend/src/styles/`, `frontend/src/assets/`, `docs/design/`  
**OUTBOX Raporu:** `docs/reports/OUTBOX/uiux_done.md`  
**Bash Başlatması:**
```bash
/project:activate uiux
```

---

### 🖥️ Frontend Developer (Sağ Üst+2 — Panel 3)
**Kimsin:** 10+ yıl, Vue3 Composition API + Pinia  

**Bootstrap:** `prompts/bootstrap_frontend_developer.md`  
**Görevleri:**
- ✅ Vue3 component'ler, Composition API
- ✅ Pinia state management
- ✅ API servisleri, Frontend test

**Yazabilir:** `frontend/src/` (tasarım hariç), `tests/frontend/`  
**YAZAMAZ:** `backend/`, `docs/requirements/`, `docs/design/`  
**OUTBOX Raporu:** `docs/reports/OUTBOX/frontend_done.md`  
**Bash Başlatması:**
```bash
/project:activate frontend
```

---

### ⚙️ Backend Developer (Sağ Üst+3 — Panel 4)
**Kimsin:** 10+ yıl, Django + DRF + Python  

**Bootstrap:** `prompts/bootstrap_backend_developer.md`  
**Görevleri:**
- ✅ Django modelleri, DRF API endpoints
- ✅ Authentication/Authorization (JWT)
- ✅ Database, optimization, Backend test

**Yazabilir:** `backend/`, `tests/backend/`  
**YAZAMAZ:** `frontend/`, `docs/requirements/`, `docs/design/`  
**OUTBOX Raporu:** `docs/reports/OUTBOX/backend_done.md`  
**Bash Başlatması:**
```bash
/project:activate backend
```

---

### 🧪 QA Engineer (Sağ Üst+4 — Panel 5)
**Kimsin:** 10+ yıl, test otomasyonu uzmanı  

**Bootstrap:** `prompts/bootstrap_qa_engineer.md`  
**Görevleri:**
- ✅ Test plan, unit/integration/E2E test
- ✅ Test raporları, bug tracking
- ✅ QA/automation framework

**Yazabilir:** `tests/` (tüm alt klasörler)  
**YAZAMAZ:** Diğer her şey (read-only)  
**OUTBOX Raporu:** `docs/reports/OUTBOX/qa_done.md`  
**Bash Başlatması:**
```bash
/project:activate qa
```

---

## � Hızlı Başlangıç — 30 Saniye Setup

### 1️⃣ Kullanıcı Komutu
```bash
/project:start-team
```

### 2️⃣ Team Lead Soru Sorar (≤1 dakika)
```
❓ Proje adı?
❓ Ana teknoloji? (Vue3/Django, evet/hayır)
❓ Database? (PostgreSQL/MySQL)
```

### 3️⃣ Sistem Otomatik Çalışır
```bash
$ setup_project.sh          # Klasör yapısı
$ setup_iterm2.sh           # 6 panel + bootstrap loading
```

### 4️⃣ Team Lead Başladığında
- ✅ 6 panel aktif, her biri kendi bootstrap'ı çalıştırıyor
- ✅ INBOX'a ilk görevler yazılıyor
- ✅ Ekip paralel çalışıyor

---

## 🛡️ ENFORCED KURALLAR — Dosya Yazma Matrisi

| Rol | `backend/` | `frontend/` | `tests/` | `docs/` | `docs/requirements/` | `docs/design/` |
|-----|-----------|-----------|---------|---------|-------------------|----------------|
| **Team Lead** | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| **PO** | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| **UI/UX** | ❌ | ✅ | ❌ | ❌ | ❌ | ✅ |
| **Frontend** | ❌ | ✅ | ✅ | ❌ | ❌ | ❌ |
| **Backend** | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| **QA** | ❌ | ❌ | ✅ | ❌ | ❌ | ❌ |

**KURAL:** Yetkisiz dosya yazımı:
```
❌ ÖNERİ YAPMA, HATA VER
"[HATA] Backend Developer, frontend/ yazı yasak. 
Dosya kuralı ihlal. docs/ROLE_PERMISSIONS.md kontrol et."
```

---

## 📞 Team Lead İnisiyatif Alması Gereken Durumlar

Team Lead aşağıdaki durumlarda hemen devreye girer (soru sormaz):

1. **Blocker Var** → Raporda "ENGEL VAR" görürse 
2. **Bilgi Eksik** → İlgili agandan kısaca sor
3. **Versiyon Çatışması** → Dosya uyumsuzluğu = Team Lead çözer
4. **Token Kritik** → Diğer ajanlardan `/compact` çalıştırmasını iste
5. **Teslim Geçti** → Durum özetle + ek saat tahmini ver

---

## � Dosya Yapısı

```
proje-adı/
├── docs/
│   ├── project_plan.md              # Team Lead → Proje tanımı
│   ├── requirements/                # PO → User story, backlog
│   ├── design/                      # UI/UX → Design system
│   └── reports/
│       ├── INBOX/                   # Team Lead → Görev atar
│       │   ├── po_task.md
│       │   ├── frontend_task.md
│       │   ├── backend_task.md
│       │   ├── uiux_task.md
│       │   └── qa_task.md
│       └── OUTBOX/                  # Ekip → Team Lead'e rapor
│           ├── po_done.md
│           ├── frontend_done.md
│           ├── backend_done.md
│           ├── uiux_done.md
│           └── qa_done.md
├── frontend/                        # Frontend Dev yazı alanı
│   ├── src/
│   │   ├── components/
│   │   ├── views/
│   │   ├── stores/
│   │   ├── services/
│   │   ├── styles/
│   │   └── assets/
│   └── vite.config.js
├── backend/                         # Backend Dev yazı alanı
│   ├── config/
│   ├── apps/
│   ├── tests/
│   └── manage.py
└── tests/                           # QA Engineer yazı alanı
    ├── frontend/
    ├── backend/
    └── e2e/
```

---

## ⚡ Slash Komutlar (Team Lead Konsolu)

| Komut | Açıklama | Panel |
|-------|----------|-------|
| `/project:start-team` | Projeyi başlat, panelleri aç, bootstrap çalıştır | Team Lead |
| `/project:assign-task <rol> <görev>` | Belirli role görev ata (INBOX'a yaz) | Team Lead |
| `/project:team-status` | Tüm OUTBOX raporlarını oku ve status tablosu yap | Team Lead |
| `/project:list-agents` | Aktif ajanları ve panel durumlarını listele | Team Lead |
| `/project:activate <rol>` | Belirli ajana bağlan (panel geç) | Herhangi |
| `/project:stop-team` | Projeyi sonlandır ve panelleri kapat | Team Lead |
| `/compact` | Oturum özetlemesi (token yönetimi) | Herhangi |

---

## 💾 Varsayılan Stack

```yaml
Frontend:
  Framework: Vue 3 (Composition API)
  State: Pinia
  Build: Vite
  Test: Vitest + Vue Test Utils
  Styles: CSS Modules / SCSS

Backend:
  Framework: Django + Django REST Framework
  Lang: Python 3.11+
  Test: pytest + pytest-django
  Auth: JWT (djangorestframework-simplejwt)
  DB: PostgreSQL (default)

DevOps:
  Container: Docker + Docker Compose
  CI: GitHub Actions

```

---

## 🎯 Takım Başlatma Checklist

- [ ] Proje adı ve hedef alındı mı?
- [ ] `setup_project.sh` çalıştırıldı mı? (klasör yapısı)
- [ ] `setup_iterm2.sh` çalıştırıldı mı? (paneller)
- [ ] `docs/project_plan.md` yazıldı mı?
- [ ] İlk görevler `docs/reports/INBOX/` yazıldı mı?
- [ ] Her ajan panel'de aktif ve çalışıyor mu?
- [ ] Dosya yetkileri doğru mı (matriks kontrol)?

---

## 📚 Rol Detaylı Dosyaları

- [Team Lead Persona](agents/team_leader.md)
- [Product Owner Persona](agents/product_owner.md)
- [Frontend Developer Persona](agents/frontend_developer.md)
- [Backend Developer Persona](agents/backend_developer.md)
- [UI/UX Designer Persona](agents/ui_ux_designer.md)
- [QA Engineer Persona](agents/qa_engineer.md)

---

## 🎯 Slash Komut Detayları (commands/ içinde)

Komut yapıları:
- `commands/project_start_team.md` → /project:start-team
- `commands/project_assign_task.md` → /project:assign-task
- `commands/project_team_status.md` → /project:team-status
- `commands/project_list_agents.md` → /project:list-agents
- `commands/project_activate.md` → /project:activate
- `commands/project_stop_team.md` → /project:stop-team

---

**Version:** 3.0 (Panel Tabanlı Paralel Ekip)  
**Güncelleme Tarihi:** 22 Nisan 2026  
**Status:** Active Production  
**Darboğaz:** OLMAYAN (6 Paralel Panel)
