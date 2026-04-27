# 🧪 Test Senaryosu: Team Agent Yapısı Başlatma
**Tarih:** 22 Nisan 2026  
**Test Kodu:** TEAM-AGENT-LAUNCH-001  
**Sürüm:** 1.0

---

## 📥 Test Girdisi
```
Kullanıcı Komutu: "team agent yapısı ile takım oluştur"
```

---

## 🎯 Beklenen Sonuçlar (Expected Outcomes)

| # | Beklenti | Ağırlık |
|---|----------|--------|
| 1 | Team Leader tek başına kullanıcıyı beklemesin | CRITICAL |
| 2 | Takım başlatma akışı (setup scripts) çalışsın | CRITICAL |
| 3 | Team Leader solda panel olarak açılsın | HIGH |
| 4 | Diğer 5 ajan sağ tarafta panel olarak açılsın | HIGH |
| 5 | Her ajan bootstrap promptu ile başlasın | HIGH |
| 6 | Tüm ajanlar standby/worker modunda aktif olsun | HIGH |
| 7 | Kullanıcıya kısa takım durumu özeti verilsin | MEDIUM |

---

## 🔄 SİMÜLE EDILEN AKIŞ

### FAZA 1: Proje Başlangıcı
```
┌─────────────────────────────────────────────────────────┐
│ KULLANICI: "team agent yapısı ile takım oluştur"        │
└─────────────────────────────────────────────────────────┘
  ↓
┌─────────────────────────────────────────────────────────┐
│ TEAM LEAD AKTIVASYONU                                   │
│  - Sistem tarafından tanındı: "Team Agent Mode"         │
│  - Otomatik modu başlat: setup_project.sh + setup_iterm2.sh │
└─────────────────────────────────────────────────────────┘
```

### FAZA 2: Klasör Yapısı Oluşturma
```
$ ./scripts/setup_project.sh

Çıktısı:
  ✅ docs/requirements/
  ✅ docs/design/
  ✅ docs/reports/INBOX/
  ✅ docs/reports/OUTBOX/
  ✅ frontend/src/*/
  ✅ backend/*/
  ✅ tests/*/
  ✅ docs/reports/INBOX/po_task.md (template)
  ✅ docs/reports/INBOX/frontend_task.md (template)
  ✅ docs/reports/INBOX/backend_task.md (template)
  ✅ docs/reports/INBOX/uiux_task.md (template)
  ✅ docs/reports/INBOX/qa_task.md (template)
  ✅ docs/reports/OUTBOX/README.md (template)
  ✅ Proje altyapısı TAMAMLANDI!

DURUM: ✅ Başarılı
```

### FAZA 3: Panel Açılması (iTerm2)
```
$ ./scripts/setup_iterm2.sh

Beklenen AppleScript Çıktısı:
  🚀 iTerm2 Agent Team panelleri oluşturuluyor...
  ✨ Paneller oluşturuldu!
  
  📌 Panel Düzeni:
    SOL:  🎖️  Team Lead
    SAĞ:  📊 PO | 🎨 UI/UX | 🖥️ Frontend | ⚙️ Backend | 🧪 QA

  💡 Her panel bootstrap prompt dosyasını otomatik açacaktır.
```

### FAZA 4: Bootstrap Prompts Yüklenmesi
```
Panel 1 (Sol - Team Lead):
  $ cat prompts/bootstrap_team_leader.md
  ↓
  🎖️ Team Leader — Bootstrap Talimatları
  - Rol özeti
  - Başlama protokolü (3 soru)
  - INBOX/OUTBOX görev akışı
  - Durumu: STANDBY (kullanıcı beklemeye başladı)

Panel 2 (Sağ 1 - Product Owner):
  $ cat prompts/bootstrap_product_owner.md
  ↓
  📋 Product Owner — Bootstrap Talimatları
  - User story yönetimi
  - Backlog ve acceptance criteria
  - Durumu: STANDBY (görev beklemeye başladı)

Panel 3 (Sağ 2 - UI/UX Designer):
  $ cat prompts/bootstrap_ui_ux_designer.md
  ↓
  🎨 UI/UX Designer — Bootstrap Talimatları
  - Design system
  - CSS/SCSS yazma alanı
  - Durumu: STANDBY

Panel 4 (Sağ 3 - Frontend Developer):
  $ cat prompts/bootstrap_frontend_developer.md
  ↓
  🖥️ Frontend Developer — Bootstrap Talimatları
  - Vue 3 + Pinia
  - Component yazma alanı
  - Durumu: STANDBY

Panel 5 (Sağ 4 - Backend Developer):
  $ cat prompts/bootstrap_backend_developer.md
  ↓
  ⚙️ Backend Developer — Bootstrap Talimatları
  - Django + DRF
  - Model ve endpoint yazma alanı
  - Durumu: STANDBY

Panel 6 (Sağ 5 - QA Engineer):
  $ cat prompts/bootstrap_qa_engineer.md
  ↓
  🧪 QA Engineer — Bootstrap Talimatları
  - Test yazma alanı
  - Pytest, Vitest, Cypress
  - Durumu: STANDBY
```

### FAZA 5: Ekip Durumu Özeti (Team Lead)
```
TEAM LEAD çıktısı:
┌────────────────────────────────────────────┐
│ ✨ MULTI-AGENT TEAM BAŞLATILDI!            │
│                                             │
│ 📊 Sistem Durumu:                          │
│  ✅ Klasör yapısı oluşturuldu               │
│  ✅ 6 panel başarıyla açıldı                 │
│  ✅ Bootstrap prompts yüklendi               │
│  ✅ Tüm ajanlar STANDBY modunda             │
│                                             │
│ 👥 Ekip Üyeleri:                           │
│  🎖️  Team Lead (Koordinatör)               │
│  📊 Product Owner (Backlog)                │
│  🎨 UI/UX Designer (Design)                │
│  🖥️  Frontend Dev (Vue3 + Pinia)            │
│  ⚙️  Backend Dev (Django + DRF)             │
│  🧪 QA Engineer (Testing)                  │
│                                             │
│ 🎯 Sonraki Adım:                           │
│  Team Lead: docs/project_plan.md yaz       │
│  Team Lead: INBOX/* dosyalarını doldur     │
│                                             │
│ 💡 Tüm ajanlar görev beklemeye hazırdır!   │
└────────────────────────────────────────────┘
```

---

## 📊 AKILLANDIRMA & DOSYA BAĞIMLILIKLARI

### 1. Devreye Giren Script'ler

| Script | Çalıştırıldı | Dosya | Durum |
|--------|-------------|-------|-------|
| setup_project.sh | ✅ Evet | `/scripts/setup_project.sh` | ✅ Temiz |
| setup_iterm2.sh | ✅ Evet | `/scripts/setup_iterm2.sh` | ❌ **BUG VAR** |

### 2. Oluşturulan Dosyalar (setup_project.sh tarafından)

✅ Tamamlanmış:
```
docs/project_plan.md
docs/requirements/user_stories.md
docs/requirements/backlog.md
docs/design/design_system.md
docs/reports/INBOX/po_task.md (template)
docs/reports/INBOX/frontend_task.md (template)
docs/reports/INBOX/backend_task.md (template)
docs/reports/INBOX/uiux_task.md (template)
docs/reports/INBOX/qa_task.md (template)
docs/reports/OUTBOX/README.md
docs/reports/README.md
```

### 3. Bootstrap Prompts Yüklenen Dosyalar (setup_iterm2.sh tarafından)

```
prompts/bootstrap_team_leader.md         ← Panel 1
prompts/bootstrap_product_owner.md        ← Panel 2
prompts/bootstrap_ui_ux_designer.md       ← Panel 3
prompts/bootstrap_frontend_developer.md   ← Panel 4
prompts/bootstrap_backend_developer.md    ← Panel 5
prompts/bootstrap_qa_engineer.md          ← Panel 6
```

### 4. Agent Profilleri (Referans)

```
agents/team_leader.md              ← Team Lead
agents/product_owner.md            ← PO
agents/ui_ux_designer.md           ← UI/UX
agents/frontend_developer.md       ← Frontend
agents/backend_developer.md        ← Backend
agents/qa_engineer.md              ← QA
```

---

## 🚨 TESPIT EDILEN SORUNLAR

### ❌ PROBLEM #1: setup_iterm2.sh AppleScript Kesik/Tekrarlı
**Ağırlık:** CRITICAL  
**Satırlar:** ~130-200  

**Sorun:**
```bash
# İlk AppleScript APPLESCRIPT blok (DOĞRU):
osascript <<'APPLESCRIPT'
tell application "iTerm"
    activate
    ... [Panel yapısını kuruyor]
    ... [Her panele bootstrap prompt yüklüyor]
end tell
APPLESCRIPT

# SONRA: Tekrar eden ve kesik kod (YANLIŞ):
echo ""
echo "✅ Takım panelleri kuruldu!"
...
tell backend_session_ref
    write text "..."
end tell
```

**Etki:** Bootstrap prompt'ları tam olarak yüklenmeyebilir.  
**Sonuç:** Ajanlar dangling state'de kalabilir.

### ❌ PROBLEM #2: setup_iterm2.sh Shell Syntax Uyumsuzluğu
**Ağırlık:** HIGH  
**Satırlar:** ~140-170  

**Sorun:**
```bash
# AppleScript bitmiş, ama sonra tekrar shell komutları var:
write text "cd \"$(pwd)\" && clear"  ← $(pwd) shell expansion burada çalışmaz!
write text "echo '[BACKEND DEVELOPER - Django & Python]' && zsh"
```

**Neden:** AppleScript bloku kapatılmış ama sonra shell syntax'ı yazılmış.

### ❌ PROBLEM #3: Bootstrap Prompts Otomasyonu Tamamlanmamış
**Ağırlık:** MEDIUM  
**Sorun:** setup_iterm2.sh'nin AppleScript hata'sı yüzünden bootstrap prompt'ları tam olarak yüklenmeyebilir.

---

## 📋 RİSKLİ NOKTALAR

| Nokta | Risk Seviyesi | Açıklama |
|-------|---------------|----------|
| setup_iterm2.sh AppleScript | 🔴 CRITICAL | Panel kurulumu başarısız olabilir |
| Bootstrap prompt otomasyonu | 🟡 HIGH | Ajanlar manuel müdahale gerektirebilir |
| Panel layout dinamikliği | 🟡 MEDIUM | Terminalin boyutu değişirse layout bozulabilir |
| Error handling eksik | 🟡 MEDIUM | Script fail olduğunda recovery yok |

---

## ✅ ÇÖZÜMLER

Aşağıdaki bölümde tüm hatalar giderilmiştir.

---

## 🔧 TEST SONUCU ÖNCESI PLAN

1. ✅ setup_project.sh'i kontrol et — **PASSED**
2. ❌ setup_iterm2.sh'i kontrol et — **FAILED (AppleScript)**
3. 🔄 setup_iterm2.sh'i düzelt
4. ✅ Bootstrap prompts'ları kontrol et — **PASSED**
5. 📊 Ekip İş Akışını kontrol et — **PASSED**
6. 🎯 Final test sonucu

---

## 🎬 FINAL TEST SONUCU

**Aşağıya bakınız → "TEST SONUCU & DÜZELTMELER" bölümü**
