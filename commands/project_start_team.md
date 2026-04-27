# /project:start-team — Ekip Başlatma Komutu

**Kullanım:** Team Lead tarafından proje başında çalıştırılır  
**Amaç:** 6 agenalı panel sistemini kurarak ekibi etkinleştirmek  
**Tekrar Çalıştırma:** Hayır (sadece başlangıçta)  

---

## Çalışma Akışı

### 1. Soruları Sor (≤1 dakika)
Team Lead, kullanıcıdan aşağıdaki soruları sorar:

```
❓ Proje adı nedir?
❓ Frontend: Vue 3 / Backend: Django kullanacak mısınız? (Evet/Hayır)
❓ Database: PostgreSQL / MySQL? (Evet/Hayır, default: PostgreSQL)
```

**KURAL:** Başka soru YAPMA. Bu 3 yeterli, minimize info yeterli.

### 2. Klasör Yapısını Kur
```bash
$ ./scripts/setup_project.sh
```

Çıktı:
```
proje-adı/
├── docs/
│   ├── project_plan.md
│   ├── requirements/
│   ├── design/
│   └── reports/
│       ├── INBOX/
│       └── OUTBOX/
├── frontend/src/
├── backend/
└── tests/
```

### 3. Panel Sistemini Aç
```bash
$ ./scripts/setup_iterm2.sh
```

Bu komut iTerm2'de 6 panel açar:
- **Sol Panel:** Team Lead (bootstrap_team_leader.md)
- **Sağ Panel 1:** Product Owner (bootstrap_product_owner.md)
- **Sağ Panel 2:** UI/UX Designer (bootstrap_ui_ux_designer.md)
- **Sağ Panel 3:** Frontend Developer (bootstrap_frontend_developer.md)
- **Sağ Panel 4:** Backend Developer (bootstrap_backend_developer.md)
- **Sağ Panel 5:** QA Engineer (bootstrap_qa_engineer.md)

Her panel kendi `prompts/bootstrap_<rol>.md` dosyasını yükler.

### 4. Proje Planını Yaz
Team Lead, `docs/project_plan.md` dosyasında yazar:

```markdown
# Proje Plan: <Proje Adı>

## Hedef
<Kısa açıklama>

## Teknoloji Stack
- Frontend: Vue 3 + Pinia
- Backend: Django + DRF
- Database: PostgreSQL
- Deployment: Docker Compose

## Başlangıç Tarihi
<Tarih>

## İlk Sprint Görevleri
- PO: User story'leri hazırla
- UI/UX: Design system oluştur
- Frontend: Component framework kur
- Backend: API base layer oluştur
- QA: Test framework hazırla
```

### 5. İlk Görevleri Atama
Team Lead, `docs/reports/INBOX/` klasörüne görev dosyaları yazar:

**Örnek:** `docs/reports/INBOX/po_task.md`
```markdown
## 📋 Görev: Proje User Story'leri

**Atayan:** Team Lead
**Tarih:** 22 Nisan 2026
**Öncelik:** Yüksek
**Teslim:** 2 saat

### Açıklama
Proje için ilk user story'leri yazın. 5-10 story olmalı.

### Kabul Kriterleri
- [ ] 5+ user story yazılmış
- [ ] Her story'nin acceptance criteria'sı var
- [ ] Story'ler MoSCoW prioritation'ı almış
- [ ] `docs/requirements/user_stories.md` dosyası oluşturulmuş

### Kaynaklar
- Proje plan: docs/project_plan.md
```

### 6. Ekibi Bilgi Ver
Team Lead, bütün ekipe bilgi verir:
- "Takım hazır, görevleriniz INBOX klasöründe"
- Paralel çalışabilirler, darboğaz yok

---

## Sonuç
```
✅ Team Lead aktif (Sol Panel)
✅ 5 Ajan aktif (Sağ Paneller)
✅ 6 Panel paralel çalışma durumunda
✅ INBOX görevleri dağıtıldı
✅ Ekip çalışıyor
```

**Durum:** `docs/project_plan.md` yazılmış ve `docs/reports/INBOX/` dolu olmalı.

---

## Başarısızlık Durumu

Eğer panel açılmadıysa:
1. iTerm2'nin kurulu olduğunu kontrol et: `which iTerm`
2. `setup_iterm2.sh` dosyasında bash hataları kontrol et
3. Terminal.app'te manual olarak başla: `$HOME/scripts/setup_iterm2.sh`

---

**Komut Dosyası:** [commands/project_start_team.md](./project_start_team.md)  
**Referans:** [CLAUDE.md - Hızlı Başlangıç](../CLAUDE.md#-hızlı-başlangıç--30-saniye-setup)  
**Status:** Temel komut ✅
