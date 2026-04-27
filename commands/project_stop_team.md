# /project:stop-team — Ekibi Durdur

**Kullanım:** Proje bittiğinde veya test sırasında ekibi kapatmak için  
**Syntax:** `/project:stop-team`  
**Uyarı:** Açık işler kaybedebilir, kaydet!

---

## Ön Koşullar

Ekibi durmadan önce:

1. **Tüm Ajanları Kontrol Et**
   ```
   /project:team-status
   ```
   - Tüm görevler tamamlandı mı?
   - Engelli kalan iş var mı?

2. **OUTBOX Raporlarını Kaydet**
   - Tüm raporları `docs/reports/OUTBOX/` den kopyala
   - Git commit'le: `git add docs/reports/OUTBOX/ && git commit -m "Final reports"`

3. **INBOX Görevlerini Arşivle** (isteğe bağlı)
   - `docs/reports/INBOX/` klasörünü yedekle
   - `ARCHIVE_INBOX/` altına taşı

---

## Komutu Çalıştır

```
/project:stop-team
```

Sistem aşağıdakileri yapacak:

### 1. Onay İster
```
⚠️ UYARI: Ekibi kapatmak üzeresiniz!

Açık panelleri kapanacak:
- Panel 1: Team Lead
- Panel 2: Product Owner
- Panel 3: UI/UX Designer
- Panel 4: Frontend Developer
- Panel 5: Backend Developer
- Panel 6: QA Engineer

Kaydedilmemiş çalışmalar kaybolabilir.

Devam etmek istiyor musunuz? (y/N): 
```

### 2. Ajanları Notify Eder (Opsiyonel)
```
📢 Bildirim gönderiliyor:

✅ Team Lead → "Ekip kapanıyor, raporunuzu kaydedin"
✅ Product Owner → "Ekip kapanıyor, raporunuzu kaydedin"
✅ UI/UX Designer → "Ekip kapanıyor, raporunuzu kaydedin"
✅ Frontend Developer → "Ekip kapanıyor, raporunuzu kaydedin"
✅ Backend Developer → "Ekip kapanıyor, raporunuzu kaydedin"
✅ QA Engineer → "Ekip kapanıyor, raporunuzu kaydedin"

Tüm ajanlar bilgilendirildi.
```

### 3. Panelleri Kapatır
```
🔌 Paneller kapatıldığında:

❌ Panel 1 (Team Lead)        → Kapatıldı
❌ Panel 2 (Product Owner)    → Kapatıldı
❌ Panel 3 (UI/UX Designer)   → Kapatıldı
❌ Panel 4 (Frontend Dev)     → Kapatıldı
❌ Panel 5 (Backend Dev)      → Kapatıldı
❌ Panel 6 (QA Engineer)      → Kapatıldı

İterminal2 window kapatıldı.
```

### 4. Kapatma Raporu Oluşturur
```
✅ Ekip durduruldu — 22 Nisan 2026, 18:45

📊 Final Raporı:
├─ Proje: Test Ekibi Demo
├─ Çalışma Süresi: 4 saat 30 dakika
├─ Tamamlanan Görevler: 5/5 ✅
├─ Engel Var mı: Hayır ❌
├─ Git Commit'ler: 12
└─ Sonuç: BAŞARILI ✅

Tüm raporlar: docs/reports/OUTBOX/ → Kaydedildi
```

---

## Kapatma Senaryoları

### Senaryo 1: Normal Kapanış (Tümü Tamamlandı)
```
/project:stop-team

Durum: Tüm görevler tamamlandı ✅
Aksiyon: "Y" ye bas, güvenli kapan
```

### Senaryo 2: Acil Durdurma (Engel Var)
```
/project:stop-team

Durum: 2 engelli görev var
Aksiyon: "Engelli görevleri bitir" seçeneğini seç
       veya /project:assign-task ile hızlandır

Alternatif: Ctrl+C ve manual kapatış
```

### Senaryo 3: Kontrollü Kapanış (Kod Kaydetme)
```
# 1. Panellere git, dosyaları kaydet
/project:activate frontend
# Ctrl+S ile dosya kaydet
# Git commit: git add . && git commit -m "Final code"

# 2. Tüm ajanlar için tekrarla

# 3. Ekibi kapat
/project:stop-team
```

---

## Kapatmadan Sonra

### OUTBOX Raporlarını Sakla
```bash
# Raporları sıkıştır
tar czf reports_backup_2026-04-22.tar.gz docs/reports/OUTBOX/

# Yedeğini al
cp reports_backup_2026-04-22.tar.gz ~/backups/
```

### Git ile Kaydet
```bash
# Tüm değişiklikleri commit'le
git add .
git commit -m "Proje tamamlandı — 22 Nisan 2026"
git push
```

### Sonraki Çalıştırma
```bash
# Yeni bir proje başlat
/project:start-team
```

---

## Manual Kapanış (Eğer Komut Çalışmazsa)

### iTerm2'de Manual Kapatış
```bash
# iTerm2 pencereyi kapat
cmd + W

# Veya tüm panelleri Ctrl+D ile kapat
ctrl + D  (her panelde)
```

### Kill Prosesleri
```bash
# Tüm iTerm2 pencereleri kapat
killall iTerm2

# Veya belirli terminal ID'sini kapat
kill -9 <PID>
```

---

## Hata Durumları

### ❌ "Panel bulunamadı" Hatası
```
❌ Paneller bulunamadı, iTerm2 açık mı?

Çözüm:
1. iTerm2'yi aç: open -a iTerm
2. Setup'ı tekrar çalıştır: ./scripts/setup_iterm2.sh
3. Komutu tekrarla: /project:stop-team
```

### ❌ "Dosya yazma hatası" Hatası
```
❌ OUTBOX raporları kaydedilemiyor

Çözüm:
1. Klasör izinleri kontrol et: ls -la docs/reports/OUTBOX/
2. El ile raporları kopyala
3. Ekibi manuel kapat
```

---

## İlgili Komutlar

- [`/project:start-team`](./project_start_team.md) — Ekip başlat
- [`/project:team-status`](./project_team_status.md) — Takım durumu
- [`/project:activate`](./project_activate.md) — Rola bağlan

---

**Status:** Ekip kapanış ✅  
**Referans:** [CLAUDE.md](../CLAUDE.md)
