# 🤖 Claude Agent Team Skill — Panel Tabanlı Çoklu-Ajan Ekibi

Bu proje, Claude Code ortamında **çoklu ajan (multi-agent)** yapısıyla çalışmak isteyen profesyonel yazılım geliştirme ekipleri için **iTerm2 panel tabanlı** özel bir sistem sunar.

## 🎯 Mimari

Tek bir Claude örneğini çeşitlendirmek yerine, **6 ayrı panelde koşan 6 bağımsız "takım üyesi"** oluşturur:

```
┌─────────────────────────────────┐
│ Sol: Team Lead (Koordinatör)    │ Sağ: 5 Ajan (Bağımsız)
│                                 │
│                                 │ PO | UI/UX | Frontend | Backend | QA
│                                 │
│ INBOX yazıyor                   │ Görev çekiyorlar
│ OUTBOX okuyor                   │ Rapor yazıyorlar
│                                 │
└─────────────────────────────────┘
```

## 👥 Ekip Üyeleri (6 Rol)

| # | Rol | Panel | Sorumluluk | Yazı Alanı |
|---|-----|-------|----------|-----------|
| **1** | **Team Lead** | Sol | Koordinasyon, INBOX yazma, OUTBOX okuma | `docs/` |
| **2** | **Product Owner** | Sağ-1 | User story, backlog, gereksinimler | `docs/requirements/` |
| **3** | **UI/UX Designer** | Sağ-2 | Design system, CSS, stil | `frontend/src/styles/` + `docs/design/` |
| **4** | **Frontend Developer** | Sağ-3 | Vue3 component'ler, Pinia | `frontend/src/` + `tests/frontend/` |
| **5** | **Backend Developer** | Sağ-4 | Django API, modeller, auth | `backend/` + `tests/backend/` |
| **6** | **QA Engineer** | Sağ-5 | Test framework, test yazma | `tests/` |

---

## 🚀 Hızlı Başlangıç — 1 Dakika

### 1. Komutu Çalıştır
```bash
/project:start-team
```

### 2. Team Lead 3 Soru Sorar
```
❓ Proje adı?
❓ Vue3/Django kullanacaksınız? (Y/N)
❓ Database: PostgreSQL? (Y/N)
```

### 3. Sistem Otomatik Başlar
- ✅ Klasör yapısı oluşturulur (`setup_project.sh`)
- ✅ 6 panel açılır (`setup_iterm2.sh`)
- ✅ Her ajan kendi bootstrap promptunu yükler
- ✅ Team Lead `docs/project_plan.md` yazıyor
- ✅ INBOX görevleri dağıtılıyor

### 4. Ekip Paralel Çalışıyor
- PO: User story yazıyor
- UI/UX: Design system kurıyor
- Frontend: Component yazıyor
- Backend: Model yazıyor
- QA: Test setup yapıyor

**Darboğaz = YOK** ✅ (Tümü bağımsız)

---

## 📞 Slash Komutlar

### Team Lead Komutları

| Komut | Açıklama | Dosya |
|-------|----------|--------|
| `/project:start-team` | Ekibi başlat, 6 panel aç | [commands/project_start_team.md](commands/project_start_team.md) |
| `/project:assign-task <rol> "<görev>"` | Role görev ata (INBOX'a yaz) | [commands/project_assign_task.md](commands/project_assign_task.md) |
| `/project:team-status` | OUTBOX raporlarını oku, status göster | [commands/project_team_status.md](commands/project_team_status.md) |
| `/project:list-agents` | Aktif ajanları listele | [commands/project_list_agents.md](commands/project_list_agents.md) |
| `/project:activate <rol>` | Belirli ajana bağlan (panel geç) | [commands/project_activate.md](commands/project_activate.md) |
| `/project:stop-team` | Ekibi durdur, panelleri kapat | [commands/project_stop_team.md](commands/project_stop_team.md) |
| `/compact` | Oturum kompakt'laştır (token yönetimi) | |

---

## 📁 Proje Yapısı

```
proje-adı/
├── CLAUDE.md                    # Ana dokümantasyon (Panel Mimari)
├── docs/
│   ├── project_plan.md          # Team Lead → Proje planı
│   ├── requirements/            # PO → User story, backlog
│   ├── design/                  # UI/UX → Design system
│   └── reports/
│       ├── INBOX/               # Team Lead → Görev atar
│       │   ├── po_task.md
│       │   ├── frontend_task.md
│       │   ├── backend_task.md
│       │   ├── uiux_task.md
│       │   └── qa_task.md
│       └── OUTBOX/              # Ekip → Rapor yazıyor
│           ├── po_done.md
│           ├── frontend_done.md
│           ├── backend_done.md
│           ├── uiux_done.md
│           └── qa_done.md
├── frontend/src/                # Frontend Dev yazı alanı
│   ├── components/
│   ├── views/
│   ├── stores/                  # Pinia
│   ├── services/
│   ├── styles/                  # UI/UX yazıyor
│   └── assets/                  # UI/UX yazıyor
├── backend/                     # Backend Dev yazı alanı
│   ├── apps/
│   ├── config/
│   └── manage.py
├── tests/                       # QA Engineer yazı alanı
│   ├── frontend/
│   ├── backend/
│   └── e2e/
├── commands/                    # Slash komut tanımları
│   ├── project_start_team.md
│   ├── project_assign_task.md
│   ├── project_team_status.md
│   ├── project_list_agents.md
│   ├── project_activate.md
│   └── project_stop_team.md
├── agents/                      # Rol profilleri
│   ├── team_leader.md
│   ├── product_owner.md
│   ├── ui_ux_designer.md
│   ├── frontend_developer.md
│   ├── backend_developer.md
│   └── qa_engineer.md
└── scripts/
    ├── setup_project.sh         # Klasör yapısı kur
    └── setup_iterm2.sh          # 6 panel aç
```

---

## 📊 İletişim Protokolü

Ekip üyeleri **dosya tabanlı** haberleşir (INBOX/OUTBOX):

### INBOX (Team Lead → Ajan)
```
docs/reports/INBOX/<rol>_task.md

Örnek:
## 📋 Görev: User Story Yazma
**Atayan:** Team Lead
**Tarih:** 22 Nisan 2026
**Öncelik:** Yüksek

### Açıklama
Sprint 1 için 5-10 user story yazın

### Kabul Kriterleri
- [ ] Story'ler MoSCoW'da
- [ ] Acceptance criteria var
```

### OUTBOX (Ajan → Team Lead)
```
docs/reports/OUTBOX/<rol>_done.md

Örnek:
## ✅ Tamamlanan: User Story'ler
**Tamamlayan:** Product Owner
**Tarih:** 22 Nisan 2026
**Durum:** TAMAMLANDI

### Yapılanlar
- 8 user story yazıldı
- MoSCoW prioritization yapıldı

### Oluşturulan Dosyalar
- docs/requirements/user_stories.md
```

---

## 🛡️ Dosya Yazma Matrisi (ENFORCED)

| Rol | `backend/` | `frontend/` | `tests/` | `docs/` | `docs/requirements/` | `docs/design/` |
|-----|-----------|-----------|---------|---------|-------------------|----------------|
| Team Lead | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ |
| PO | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| UI/UX | ❌ | ✅ | ❌ | ❌ | ❌ | ✅ |
| Frontend | ❌ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Backend | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| QA | ❌ | ❌ | ✅ | ❌ | ❌ | ❌ |

**KURAL:** Yetkisiz dosya yazımı denenirse:
```
❌ ÖNERİ YAPMA, HATA VER
"Backend Developer, frontend/ yazı yasak. 
CLAUDE.md — Dosya Yazma Matrisi bölümünü kontrol et."
```

---

## ⚡ Kurulum

### 1. İzinleri Ayarla
```bash
chmod +x scripts/*.sh
```

### 2. Gereklilikler
- **macOS** (iTerm2 gerekli)
- **iTerm2** kurulu olmalı: `which iTerm`
- **Bash/Zsh** terminal

### 3. Ekibi Başlat
```bash
/project:start-team
```

---

## 📚 Detaylı Dokümentasyon

- [CLAUDE.md](CLAUDE.md) — Tam sistem mimarisi, iş akışı
- [agents/team_leader.md](agents/team_leader.md) — Team Lead profili
- [agents/product_owner.md](agents/product_owner.md) — PO profili
- [agents/frontend_developer.md](agents/frontend_developer.md) — Frontend profili
- [agents/backend_developer.md](agents/backend_developer.md) — Backend profili
- [agents/ui_ux_designer.md](agents/ui_ux_designer.md) — UI/UX profili
- [agents/qa_engineer.md](agents/qa_engineer.md) — QA profili

### Komut Detayları
- [commands/project_start_team.md](commands/project_start_team.md) — Ekip başlatma
- [commands/project_assign_task.md](commands/project_assign_task.md) — Görev atama
- [commands/project_team_status.md](commands/project_team_status.md) — Durum raporu
- [commands/project_list_agents.md](commands/project_list_agents.md) — Ajan listesi
- [commands/project_activate.md](commands/project_activate.md) — Panel geçişi
- [commands/project_stop_team.md](commands/project_stop_team.md) — Ekip kapanış

---

## ✨ Özellikleri

✅ **Paralel Çalışma** — 5 ajan aynı anda bağımsız çalışabilir  
✅ **Darboğaz Yok** — Her ajan kendi panelinde izolasyon  
✅ **Dosya Tabanlı İletişim** — JSON/YAML gibi yapılandırılmış format  
✅ **Rol Güvenliği** — Backend'ci Frontend dosyasına yazamaz  
✅ **Hızlı Başlangıç** — 30 saniyede kurulum + bootstrap  
✅ **Türkçe Konuşma** — Team Lead her zaman Türkçe  
✅ **Gereksiz Soru Yok** — Minimum 3 soru, sonra görev tabanlı  
✅ **Git Uyumlu** — `docs/reports/INBOX/OUTBOX` versionlanabilir  

---

## 🎓 Stack Varsayılanları

```yaml
Frontend:
  Framework: Vue 3 (Composition API)
  State: Pinia
  Build: Vite
  Test: Vitest + Vue Test Utils

Backend:
  Framework: Django + Django REST Framework
  Lang: Python 3.11+
  Auth: JWT (djangorestframework-simplejwt)
  DB: PostgreSQL (default)

DevOps:
  Container: Docker + Docker Compose
  CI/CD: GitHub Actions
```

---

## ❓ SSS

**S: Team Lead darboğaz mı olur?**  
Cevap: **Hayır.** Team Lead sadece koordine eder. Diğer 5 ajan paralel çalışıyor.

**S: Panel kaç dakika açılır?**  
Cevap: **~1 dakika.** Setup + iTerm2 grid + Bootstrap yüklemesi.

**S: Engel varsa ne yapmalı?**  
Cevap: OUTBOX'a "ENGEL VAR" yaz, Team Lead hemen görecek ve çözecek.

**S: Tüm ajanlar aynı anda çalışabilir mi?**  
Cevap: **Evet!** Her biri kendi panelde, kendi işinde.

**S: Darboğaz varsa?**  
Cevap: **YOK.** Sistem paralel mimari ile tasarlandı, sıradaki ajan beklemez.

---

## 📝 Lisans & İletişim

Bu skill açık kaynaktır. [CLAUDE.md](CLAUDE.md) dosyasında tam sistem detayları bulabilirsiniz.

**Version:** 3.0 (Panel Tabanlı Paralel Ekip)  
**Güncelleme:** 22 Nisan 2026  
**Status:** ✅ Production Ready
