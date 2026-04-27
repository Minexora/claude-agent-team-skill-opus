# 📁 Dosya Tabanlı Görev Akışı - Test Örnekleri

> ⚠️ **Bu klasör TEST & REFERANS amaçlıdır!**  
> **Asıl sistem:** `docs/reports/INBOX` ve `docs/reports/OUTBOX`

---

## 🎯 Gerçek Klasör Yapısı (CLAUDE.md'ye göre)

```
docs/reports/
├── INBOX/          ← Team Lead BURAYA görev bırakır
│   ├── po_task.md
│   ├── frontend_task.md
│   ├── backend_task.md
│   ├── uiux_task.md
│   └── qa_task.md
├── OUTBOX/         ← Ajanlar BURAYA rapor yazarlar
│   ├── po_report.md
│   ├── frontend_report.md
│   ├── backend_report.md
│   ├── uiux_report.md
│   └── qa_report.md
└── README.md       ← İletişim protokolü
```

---

## 📄 Bu Klasördeki Dosyalar (SADECE REFERANS)

- **WORKFLOW.md** — Tam görev akışı detaylı açıklaması
- **QUICKSTART.md** — 2 dakikalık hızlı başlangıç
- **FORMAT_GUIDE.md** — Dosya formatı standartları
- **TOOLS.md** — Araçlar ve komutlar

---

## ✅ Gerçek Başlangıç

1. **`setup_project.sh` çalıştır:**
   ```bash
   chmod +x scripts/*.sh
   ./scripts/setup_project.sh
   ```
   Bu `docs/reports/` klasörleri ve template dosyalarını oluşturur.

2. **CLAUDE.md oku:**
   ```bash
   cat CLAUDE.md
   ```

3. **Team Lead panel'i aç:**
   ```bash
   ./scripts/setup_iterm2.sh  # iTerm2'de 6 panel açar
   ```

4. **Team Lead: docs/reports/INBOX/* dosyalarını doldur ve görev dağıt**

5. **Ajanlar: docs/reports/OUTBOX/* dosyalarına rapor yaz**

---

**BKNS:** workspace klasörü proje örneği için yapılmıştır. Gerçek sistem `docs/reports/` üzerinde çalışır.

| [FORMAT_GUIDE.md](FORMAT_GUIDE.md) | Task/Report yazma detayları, SMART criteria'ler |
| [TOOLS.md](TOOLS.md) | Bash komutları, CI/CD entegrasyonu |

---

## 🤖 Roller ve Sorumlulukları

| Rol | Görev | Rapor |
|-----|-------|-------|
| **Team Lead** | Proje planı, sprint goals, ekip koordinasyonu | Ekip durumu, blocker'lar, next steps |
| **Product Owner** | User story'ler, requirements, backlog | Backlog listeleri, sprint planning, feedback |
| **UI/UX Designer** | Design system, component guide, mockup'lar | Design dosyaları, CSS/SCSS, Figma linkler |
| **Frontend Dev** | Component'ler, state management, API entegrasyonu | Oluşturulan component'ler, test raporu, performance |
| **Backend Dev** | API endpoint'leri, model'ler, database migration | Oluşturulan endpoint'ler, database schema, test raporu |
| **QA Engineer** | Test plan'ı, test case'leri, quality kontrol | Test raporu, bulunan hatalar, coverage metrikler |

---

## 🔄 İş Akışı Diyagramı

```
Team Lead
    ↓
[Görev Atar] → workspace/inbox/{role}/task.md
    ↓
Ajan
    ↓
[Görevi Okur] → workspace/inbox/{role}/task.md
    ↓
[Çalışır]
    ↓
[Rapor Yazıyor] → workspace/outbox/{role}/report.md
    ↓
Team Lead
    ↓
[Raporu Okur] → workspace/outbox/{role}/report.md
    ↓
[Durum Kontrol Eder]
    ↓
[Sonraki Görev] → workspace/inbox/{role}/task.md
    ↓
... (Tekrar)
```

---

## ⏱️ Standart Akış Zamanları

| Aşama | Süre | Not |
|-------|------|-----|
| Görev Atma | 5-10 min | Team Lead hazırlanır |
| Görev Alınması | 1-5 min | Ajan okunur, anlar |
| Çalışma | 1-16 saat | Task complexity |
| Rapor Yazma | 10-30 min | Ajan sonuçları dokümante eder |
| Rapor Okuma | 5-10 min | Team Lead kontrol eder |
| **Toplam Döngü** | **24-48 saat** | Standart sprint |

---

## ✅ Başarı Kriterleri

- ✅ **Bağımsız Çalışma:** Ajanlar paralel çalışabilmeli
- ✅ **Görünürlük:** Herkes ekip durumunu görebilmeli
- ✅ **Hız:** Görev-rapor döngüsü ≤ 24 saat
- ✅ **Kalite:** Acceptance criteria'ler net, testlenebilir
- ✅ **Takip:** Blocker'lar hızlıca çözülmeli

---

## 🛠️ Kullanışlı Komutlar

### Durumu Kontrol Et
```bash
# Tüm görevleri listele
find workspace/inbox -name "task.md" -exec ls -lh {} \;

# Tamamlanan raporları listele
find workspace/outbox -name "report.md" -exec ls -lh {} \;

# Blocker'ları bul
grep -r "ENGEL VAR" workspace/outbox/
```

### Spesifik Rol'ü Kontrol Et
```bash
# Frontend Developer'ın görevini oku
cat workspace/inbox/frontend_developer/task.md

# Frontend Developer'ın raporunu oku
cat workspace/outbox/frontend_developer/report.md
```

### Arşivle
```bash
# Tamamlanan raporları arşivle
mkdir -p workspace/archive/$(date +%Y-%m-%d)
mv workspace/outbox/*/report.md workspace/archive/$(date +%Y-%m-%d)/ 2>/dev/null || true
```

---

## 📊 Görev Yaşam Döngüsü

| Aşama | Dosya | Durum | Açıklama |
|-------|-------|-------|----------|
| 1. Atama | `inbox/{role}/task.md` | **Atanmış** | Team Lead yazdı |
| 2. Çalışma | `inbox/{role}/task.md` | **Devam Ediyor** | Ajan çalışıyor |
| 3. Tamamlama | `outbox/{role}/report.md` | **TAMAMLANDI** | Ajan rapor verdi |
| 4. Onay | `outbox/{role}/report.md` | **Onaylandı** | Team Lead onayladı |
| 5. Arşiv | `archive/[DATE]/report.md` | **Arşivlendi** | Opsiyonel |

---

## 💡 İpuçları

1. **Görev Adı:** Action verb ile başlamalı (Write, Create, Build, Design, Test)
2. **Acceptance Criteria:** SMART format (Specific, Measurable, Achievable, Relevant, Time-bound)
3. **Deadline:** Realistic olmalı (task complexity × 1.2)
4. **Bağımlılıklar:** Minimize et, paralel çalışmayı artır
5. **Rapor Sıklığı:** Kritik görevler → günlük, normal → haftalık
6. **Blocker İletişimi:** Hemen bildir, başkaları görev'e başlasın
7. **Metrikler:** Test coverage, performance, quality scores ekle

---

## 🎓 Örnek Senaryo

### Senaryo: Login Feature Sprint

**Sprint Süresi:** 5 gün (Mon - Fri)

**Pazartesi Sabahı:**
```
Team Lead → 3 görev atar:
  1. PO'ye: Write user login requirements
  2. Designer'a: Create login UI mockup
  3. Frontend'e: "Bu başlamadan önce designer bitsin" 
```

**Pazartesi Öğleden Sonra:**
```
PO → Görev tamamlanır
  Requirements raporını yazar

Designer → Görev tamamlanır
  Figma linkini ve CSS'i raporlar
```

**Salı Sabahı:**
```
Frontend Dev → Görev alır
  UI/CSS'i gösterir
  
Backend Dev → Paralel görev alır
  API endpoint'ini yapıyor
```

**Çarşamba Sabahı:**
```
Frontend Dev → Rapor: Component tamamlandı
Backend Dev → Rapor: API tamamlandı
```

**Perşembe:**
```
QA Engineer → Paralel görev alır
  Test case'leri yazıyor
  Tüm component'leri test ediyor
```

**Cuma:**
```
QA Engineer → Rapor: Tüm test'ler pass
Team Lead → Durum: Feature ready for production
```

---

## 📞 Sık Sorulan Sorular

**S: Rapor yazmanız kaç zaman alır?**  
Cevap: 10-30 dakika. Acceptance criteria'leri kontrol et, dosyaları listele, metrikler ekle.

**S: Engel varsa ne yapmalı?**  
Cevap: "ENGEL VAR" durumunu belirt, açıkla, çözüm öner. Diğer görev'lere devam et.

**S: Tamamlanan görevleri nereye arşivlemeliyim?**  
Cevap: `workspace/archive/YYYY-MM-DD/` klasörüne (opsiyonel, takip için).

**S: Görev'i değiştirmem gerekirse?**  
Cevap: Task dosyasını güncelle, engel ekle, Team Lead'e bildir.

**S: Birden fazla görev alabilir miyim?**  
Cevap: Evet, ancak asıl odak bir görev'de, diğerleri secondary.

---

## 📚 Daha Fazla Bilgi

- **Detaylı Workflow:** → [WORKFLOW.md](WORKFLOW.md)
- **Format Rehberi:** → [FORMAT_GUIDE.md](FORMAT_GUIDE.md)
- **Araçlar & Otomasyon:** → [TOOLS.md](TOOLS.md)
- **Ekip Danışmanı:** → Rol spesifik dosyalar (`agents/`)

---

**Versiyon:** 1.0  
**Güncelleme:** 21 Nisan 2026  
**Status:** ✅ Active & Production Ready

---

> **💡 Başla:** [WORKFLOW.md](WORKFLOW.md) dosyasını oku veya şimdi bir görev at!
