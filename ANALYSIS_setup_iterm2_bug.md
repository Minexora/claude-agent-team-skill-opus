# 🔍 setup_iterm2.sh — BUG DETAYı & ANALIZ

**Dosya:** `/scripts/setup_iterm2.sh`  
**Durum:** ❌ BROKEN (AppleScript kesik)  
**Etki:** Bootstrap prompts tam yüklenmez, ajanlar dangling state'de kalır

---

## 🐛 SORUN #1: İki AppleScript Bloku Çatışması

### Sorunlu Kod (Satır 47-90, ~140-185)

```bash
# ✅ BİRİNCİ APPLESCRIPT BLOKU (SAT. 14-90)
osascript <<'APPLESCRIPT'
tell application "iTerm"
    activate
    ...
    -- ADIM 3: Her panele başlık ve bootstrap prompt dosyası yükle
    
    tell left_session
        write text "cd \"'${PROJECT_ROOT}'\" && clear"
        ...
        write text "cat prompts/bootstrap_team_leader.md"    ← ✅ DOĞRU
    end tell
    ...
end tell
APPLESCRIPT

echo ""
echo "✨ Paneller oluşturuldu!"
...

# ❌ İKİNCİ APPLESCRIPT BLOKU (SAT. ~130-190) — EKSIK & TEKRAR
                                 ↓ BURAYA KADAR İKİNCİ BLOK VAR
            write text "cd \"$(pwd)\" && clear"  ← ❌ SYNTAX HATA
            delay 0.5
            write text "echo '[FRONTEND DEVELOPER - Vue3 & Pinia]' && zsh"
        end tell
        ...
```

**Sonuç:** 
- ❌ İlk `osascript` bloku doğru şekilde kapanıyor (`APPLESCRIPT`)
- ❌ Ancak sonra tekrar `tell backend_session_ref`, `tell qa_session` vs. yazılmış
- ❌ Bu CodeBlocks `osascript` bloku dışında → Shell interpret eder → SYNTAX ERROR
- ❌ Bootstrap prompt'ları tam yüklenmez

---

## 🐛 SORUN #2: Shell Variable Expansion Hatası

### Sorunlu Satır (~145)
```bash
write text "cd \"$(pwd)\" && clear"
```

**Neden Hata:**
- `$(pwd)` → Bash'te `current working directory`'i substitue eder
- AMA **AppleScript** içinde `write text` komutuna gönderiliyor
- AppleScript, `$(pwd)` literal olarak yorumluyor (evaluatior yapmıyor)
- ❌ **Sonuç:** Terminal'de literal `cd "$(pwd)" && clear` yazılır, execute olmaz

**Doğrusu:**
```applescript
write text "cd \"" & PROJECT_ROOT & "\" && clear"
```
VEYA shell expansion için:
```bash
write text "cd '${PROJECT_ROOT}' && clear"  ← Bash substitutes first
```

---

## 🐛 SORUN #3: Tekrar Eden Kod (Duplicate)

### Sorunlu Kısım (SAT. ~100-185)
```bash
# Satır 47-90: ✅ Temiz AppleScript bloku
osascript <<'APPLESCRIPT'
...
end tell
APPLESCRIPT

echo ""
echo "✨ Paneller oluşturuldu!"
...

# SAT. ~130+: ❌ AYNAI APPLESCRIPT KOD TEKRAR EDİLİYOR (KESIK HALİ)
                            ↓
            write text "cd \"$(pwd)\" && clear"
            delay 0.5
            ...
        end tell
        ...
    end tell
end tell
APPLESCRIPT  ← İkinci APPLESCRIPT
```

**Sonuç:** AppleScript bloku 2 kez yazılmış, 2. kez ise **TESLİME GELEMİŞ**.

---

## 📊 KONTROL LİSTESİ

| Kontrol Noktası | Beklenen | Gerçek | Durum |
|-----------------|----------|--------|-------|
| AppleScript bloku sayısı | 1 | 2 | ❌ |
| Bootstrap prompts yükleme | Her panele | Kısmen | ❌ |
| Shell syntax tutarlılığı | Konsisten | Karışık | ❌ |
| Panel açılması | Başarılı | Kısmi | ⚠️ |

---

## 🔧 FİX STRATEJİSİ

1. **Çift AppleScript blokunu birleştir**
   - İlki temiz, onu sakla
   - İkincisini sil

2. **Shell variable'larını doğru expanse et**
   - `${PROJECT_ROOT}` kullan (bash expands)
   - AppleScript string interpolation değil

3. **Test et**
   - macOS iTerm2'de çalıştır
   - 6 panelin açıldığını kontrol et
   - Bootstrap prompts'ları doğru şekilde loadır mı?

---

## ✅ DÜZELTİLMİŞ VERSİYON (AŞAĞI BAKTINIZ)

File: [scripts/setup_iterm2.sh](../scripts/setup_iterm2.sh) — **Updated & Fixed**
