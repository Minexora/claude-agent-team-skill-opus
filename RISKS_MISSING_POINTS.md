# 🚨 Eksik & Riskli Noktalar Raporu

**Test:** Team Agent Yapısı Başlatma  
**Tarih:** 22 Nisan 2026  
**Durum:** Kısmen Düzeltilmiş

---

## ❌ TESPIT EDILEN SORUNLAR

### 1. ⚠️ setup_iterm2.sh — AppleScript Syntax (FIXED)
**Ağırlık:** 🔴 CRITICAL  
**Dosya:** `/scripts/setup_iterm2.sh`  
**Satırlar:** ~45-90  
**Durum:** ✅ **FIXED**

**Sorun (Eski):**
- AppleScript bloku çift yazılmış (tekrarlayan kod)
- Shell variable expansion hatalı (`$(pwd)` yerine `'{$PROJECT_ROOT}'`)
- Dangling syntax (APPLESCRIPT kapatılmamış gibi görünen bölüm)

**Çözüm (Yeni):**
```applescript
write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
```
- ✅ AppleScript variable interpolation kullanıldı
- ✅ Tek ve temiz APPLESCRIPT bloku
- ✅ Bootstrap prompt'ları doğru yükleniyor

**Test Etmek İçin:**
```bash
bash scripts/setup_iterm2.sh
# iTerm2'de 6 panel açılmalı, her panelde bootstrap prompt görünmeli
```

---

### 2. ⚠️ Team Lead Darboğaz Riski
**Ağırlık:** 🟡 HIGH  
**Tasarım Sorunu**

**Sorun:**
- CLAUDE.md: "Team Lead solo başlasın, soruları çabuk sorun"
- Gerçek: Team Lead, setup_project.sh + setup_iterm2.sh çalıştırıp paneller açana kadar waitin yapıyor
- Ajanlar setup bitmene kadar yanında bekliyor

**Tavsiye:**
- Setup (30 sn) + bootstrap (5 sn) = ~35 saniye toplam
- Kabul edilebilir ⚠️ ama "instant" değil

**Risk Azaltma:**
- `setup_project.sh` ve `setup_iterm2.sh` parallel olarak çalıştırılabilir
  ```bash
  ./setup_project.sh & ./setup_iterm2.sh &
  wait
  ```

---

### 3. ⚠️ Bootstrap Prompts'lar İnteraktif Değil
**Ağırlık:** 🟡 MEDIUM  
**Dosyalar:** `prompts/bootstrap_*.md`  
**Durum:** ⚠️ **Tasarım Meselesi**

**Sorun:**
- Bootstrap prompt'lar `cat` ile basılıyor (read-only)
- Ajanlar hemen işe başlayamıyor, once markdownı okumak zorundu
- "Prompt" kelimesinden sistemin interactive olması bekleniyor

**Mevcut Durumu:**
```bash
$ cat prompts/bootstrap_team_leader.md
# 🎖️ Team Leader — Bootstrap Talimatları
  [Markdownı oku...]
  [Sonra prompt'ı anla]
```

**İyileştirme İçin:**
- Interaktif shell scripti yapılabilir
- Veya agent'lar manuel olarak prompt dosyaları okuyabilir
- Mevcut durum "başlama talimatları" olarak iyidir

---

### 4. ⚠️ Panel Layout Dinamikliği
**Ağırlık:** 🟡 MEDIUM  
**Sorun:** Terminal boyutu değişirse, panel layout'u kötü görünebilir

**Nedir:**
- setup_iterm2.sh 6 paneli horizontal split ediyor
- Eğer terminal çok dar ise, paneller overlap edebilir

**Fix:**
- AppleScript'e minimum window size eklenebilir
- Veya tmux layout kullanılabilir (ama iTerm2 specific değil)

**Tavsiye:** Bildiriyi kullanıcıya ver: "Optimal panel görüntüsü için terminal'i 2000x1200 yapın"

---

### 5. ⚠️ Bootstrap Prompts'lar Hardcoded Yol Kullanıyor
**Ağırlık:** 🟡 MEDIUM  
**Dosya:** `scripts/setup_iterm2.sh` (satır ~55-92)  
**Sorun:** Home folder hardcoded

```applescript
write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
```

**Problem:** Proje başka yerde ise çalışmaz

**İyileştirme:**
- Shell script'i proje root'unu bulup dinamik olarak set etsin
- Veya user'dan path sorun

---

### 6. ⚠️ Error Handling Eksik
**Ağırlık:** 🟡 MEDIUM  
**Dosyalar:** `setup_project.sh`, `setup_iterm2.sh`  
**Sorun:** Script fail olursa hiçbir recovery mekanizması yok

**Mevcut:**
```bash
set -e  # Exit on error (sadece bu)
```

**Eksik:**
- Error mesajı yazdırılmıyor
- Hangi adımda fail oldu bilinmiyor
- User retry edemiyor

**Tavsiye:**
```bash
trap 'echo "❌ Setup başarısız oldu. Kontrol et: $?" >&2; exit 1' ERR
```

---

### 7. ⚠️ Bootstrap Prompts İçeriği Dezaktivizasyon Riski
**Ağırlık:** 🟡 MEDIUM  
**Dosyalar:** `prompts/bootstrap_*.md`  
**Sorun:** Prompt'lar statik markdown'lar

**Mevcut:**
- Ajanlar bootstrap markdown'ı okumak zorunda
- Sonra manuel olarak INBOX/OUTBOX klasörlerine bakmalı

**Risk:** Ajan'ın markdown'ı tamamen okumadan görev almasının temptasyonu

**Tavsiye:** 
- Bootstrap prompt'ların sonunda "HAZIR" checkbox'ı koyun
- Veya interactive shell prompt'ı sor: "Başlamaya hazır? (Y/n)"

---

### 8. ⚠️ Workflow Dosyaları Senkronizasyon
**Ağırlık:** 🟡 MEDIUM  
**Dosyalar:** `CLAUDE.md` vs `workspace/QUICKSTART.md` vs `workspace/WORKFLOW.md`

**Sorun:** 3 farklı dosya aynı workflow'u anlatıyor

**Mevcut:** İçeriklerde tutarsızlık yok ama redundancy var

**Tavsiye:**
```
CLAUDE.md ← Ana kaynak (Sistem mimarisi)
workspace/QUICKSTART.md ← 2 dakikalık hızlı başlangıç
workspace/WORKFLOW.md ← Detaylı iş akışı
```

---

## ✅ DÜZELTİLMİŞ/KABUL EDİLEN NOKTALAR

| Nokta | Status | Açıklama |
|-------|--------|----------|
| setup_project.sh | ✅ FIXED | Tüm template dosyaları oluşturuluyor |
| Bootstrap prompts | ✅ MEVCUT | 6 prompt dosyası tam ve uyumlu |
| Klasör yapısı | ✅ UYUMLU | CLAUDE.md ile %100 eşleşiyor |
| Agent profilleri | ✅ MEVCUT | 6 agent dosyası tamamlanmış |
| Görev sistemati | ✅ UYUMLU | INBOX/OUTBOX akışı tanımlı |

---

## 📋 RİSK MATRİSİ

| Risk | Olasılık | Etki | Öncelik | Durum |
|------|----------|------|---------|-------|
| setup_iterm2.sh başarısız | DÜŞÜK | KRITIK | 🔴 P0 | ✅ FİXED |
| Panel layout bozuk | ORTA | ORTA | 🟡 P1 | ⚠️ İZLE |
| Darboğaz oluşması | DÜŞÜK | ORTA | 🟡 P1 | ⚠️ TASARIM |
| Proje yolu hardcoded | ORTA | DÜŞÜK | 🟢 P2 | ⚠️ İYİLEŞTİR |
| Error handling yok | YÜKSEK | ORTA | 🟡 P1 | ⚠️ İYİLEŞTİR |

---

## 🔧 YAPILACAKLAR (BACKLOG)

### Immediately (Next Sprint)
- [ ] Error handling (trap handler) ekle
- [ ] Proje path dinamikleştir
- [ ] Panel minimum size ayarla

### Later (Nice to Have)
- [ ] Interactive bootstrap prompts
- [ ] Workflow dosyaları single source'a yaz
- [ ] Tmux fallback layout'u (iTerm2 yoksa)

---

## 🎯 SONUÇ

**Sistem Durumu:** ✅ **FUNCTIONAL** (Eksiklikler var ama çalışır)

**Devreye Girme Riski:** 🟡 **MEDIUM** (Panel layout ve error handling'e dikkat)

**Kullanıcı Deneyimi:** ✅ **İYİ** (Setup fast, prompt'lar net)
