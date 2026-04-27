# 📟 Proje Komutları

Bu klasör, multi-agent yazılım ekibini kontrol etmek için slash komutlarını tanımlar.

## Kullanılabilir Komutlar

### 1. `/project:start-team`
Yeni bir projeyi sıfırdan başlatır ve takım panellerini ayarlar.
- **Giriş:** Proje adı, teknoloji seçimi
- **Çıkış:** Oluşturulmuş proje klasörü, paneller, ilk planı

### 2. `/project:assign-task`
Belirli bir role görev atar.
- **Giriş:** Rol adı, görev tanımı
- **Çıkış:** Atanmış görev INBOX dosyası

### 3. `/project:team-status`
Takımın mevcut durumunu gösterir.
- **Giriş:** Yok (opsiyonel parametreler: `--full`, `--blocker`)
- **Çıkış:** Durum tablosu, blocker listesi

### 4. `/project:list-agents`
Mevcut ekip üyelerini ve özelliklerini listeler.
- **Giriş:** Yok
- **Çıkış:** Ekip üyeleri, yetkiler, durum

### 5. `/project:stop-team`
Takımı ve panelleri kapatır.
- **Giriş:** Yok
- **Çıkış:** Kapatma onayı, rapor arşivi

---

## Komut Dosya Formatı

Her komut dosyası aşağıdaki bölümleri içerir:

```markdown
# /project:command-name

## Purpose (Amaç)
Ne için ve ne zaman kullanılır.

## Input (Giriş)
Beklenen parametreler ve formatı.

## Behavior (Davranış)
Adım adım ne yapılacağı.

## Output (Çıkış)
Komut sonrasında ne görülecek/oluşacak.
```

---

## İletişim Protokolü

- **Dosya Tabanlı:** Komutlar `docs/reports/INBOX/` ve `OUTBOX/` klasörlerini kullanır
- **Format:** Markdown (.md) dosyaları
- **Rol Yetkileri:** [CLAUDE.md](../../CLAUDE.md) > Dosya Yazma Yetki Matrisi
- **Bootstrap:** Yeni paneller [prompts/](../../prompts/) altındaki bootstrap dosyalarını kullanır

---

## Hızlı Başlangıç

```bash
# 1. Takımı başlat
/project:start-team

# 2. Ekip üyelerini gör
/project:list-agents

# 3. Görev ata
/project:assign-task

# 4. Durum kontrolü (hergün)
/project:team-status

# 5. Takımı kapat (proje bitince)
/project:stop-team
```

---

**Versiyon:** 2.0  
**Güncellenme:** 21 Nisan 2026  
**Durum:** Production
