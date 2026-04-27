# 🚀 Dosya Tabanlı Görev Akışı - QUICKSTART

> **2 dakika içinde başla!**

---

## 📋 Adım 1: Klasör Yapısını Anla (30 saniye)

```
workspace/
├── inbox/          ← BURAYA görev bırakılır
│   ├── team_leader/task.md
│   ├── product_owner/task.md
│   ├── ui_ux_designer/task.md
│   ├── frontend_developer/task.md
│   ├── backend_developer/task.md
│   └── qa_engineer/task.md
└── outbox/         ← BURADAN rapor alınır
    ├── team_leader/report.md
    ├── product_owner/report.md
    ├── ui_ux_designer/report.md
    ├── frontend_developer/report.md
    ├── backend_developer/report.md
    └── qa_engineer/report.md
```

---

## 👨‍💼 Team Lead: Görev At (1 dakika)

### 1. Dosya Oluştur
`workspace/inbox/[role]/task.md`

### 2. Template'i Doldur

```markdown
## 📋 Görev: [Başlık - Action verb ile]

**Atayan:** Team Lead  
**Tarih:** [Bugünün tarihi]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Hedef tarihi]  

### 📝 Açıklama
[Ne yapılmalı? Neden? Kısaca nasıl?]

### ✅ Kabul Kriterleri
- [ ] Kriter 1 (Specific)
- [ ] Kriter 2 (Measurable)
- [ ] Kriter 3 (Achievable)

### 🔗 Bağımlılıklar
- [Başka görev varsa]

---
**Status:** Atanmış  
**Alıcı:** [Role adı]
```

### 3. Örnek

```markdown
## 📋 Görev: Write User Authentication API Documentation

**Atayan:** Team Lead  
**Tarih:** 2026-04-21  
**Öncelik:** Yüksek  
**Deadline:** 2026-04-23  

### 📝 Açıklama
Backend'de yazılan authentication endpoint'lerini OpenAPI 3.0 
standardında dokümante et. Frontend team bunu referans alacak.

### ✅ Kabul Kriterleri
- [ ] OpenAPI spec oluşturuldu
- [ ] Login/Register endpoint'leri dokümante edildi
- [ ] Error case'ler tanımlandı
- [ ] Swagger UI'da görülebiliyor

---
**Status:** Atanmış  
**Alıcı:** Backend Developer
```

---

## 🤖 Ajan: Görev Al ve Yapıyorum (30 saniye + çalışma süresi)

### 1. Görev'i Oku
`workspace/inbox/[role]/task.md` → Dosyayı aç

### 2. Kontrol Et
- ✅ Acceptance criteria'yi anladım?
- ✅ Bağımlılıklar tamamlandı mı?
- ✅ Deadline realistik mi?
- ❓ Sorular var mı? → Team Lead'e sor

### 3. Çalış
- Acceptance criteria'leri takip et
- Test yaz
- Kalite kontrol yap

---

## ✅ Ajan: Rapor Yaz (1 dakika)

### 1. Dosya Oluştur
`workspace/outbox/[role]/report.md`

### 2. Template'i Doldur

```markdown
## ✅ Tamamlanan: [Aynı başlık]

**Tamamlayan:** [Role adı]  
**Tarih:** [Bugünün tarihi]  
**Durum:** [TAMAMLANDI / KISMI / ENGEL VAR]  

### 🎯 Yapılanlar
- Yapılan iş 1
- Yapılan iş 2
- Yapılan iş 3

### 📁 Oluşturulan Dosyalar
- `path/to/file.py`
- `path/to/file.vue`

### ⚠️ Engeller (varsa)
- **Engel 1:** Açıklama
  - Çözüm: Önerilen çözüm

### ✅ Kontrol Listesi
- [x] Kriter 1 ✅
- [x] Kriter 2 ✅
- [x] Kriter 3 ✅
- [x] Test'ler pass
- [x] Code review geçti

---
**Onay:** [Kişi]  
**Next:** [Sonraki görev]
```

### 3. Örnek

```markdown
## ✅ Tamamlanan: Write User Authentication API Documentation

**Tamamlayan:** Backend Developer  
**Tarih:** 2026-04-23  
**Durum:** TAMAMLANDI  

### 🎯 Yapılanlar
- OpenAPI 3.0.0 specification oluşturuldu
- Login, Register, Refresh endpoint'leri dokümante edildi
- 12 error case'i tanımlandı
- Swagger UI ve ReDoc entegre edildi

### 📁 Oluşturulan Dosyalar
- `backend/docs/openapi.yaml`
- `backend/docs/examples.md`

### ✅ Kontrol Listesi
- [x] OpenAPI spec valid ✅
- [x] Swagger UI çalışıyor ✅
- [x] Tüm endpoint'ler covered ✅
- [x] Error handling documented ✅

---
**Next:** Implement rate limiting
```

---

## 👨‍💼 Team Lead: Rapor Oku (30 saniye)

### 1. Raporu Aç
`workspace/outbox/[role]/report.md`

### 2. Kontrol Et
- ✅ Durum nedir? (TAMAMLANDI mı?)
- ✅ Engeller var mı? → Çöz!
- ✅ Sonraki görev hazırlanabilir mi?

### 3. Sonraki Adım
- Engel varsa çöz
- Sonraki görev'i hazırla
- Başka role bildir

---

## 📊 Status Özeti

| Durum | Anlamı | Yapılacak |
|-------|--------|----------|
| **TAMAMLANDI** | Tüm acceptance criteria karşılandı | ✅ Merge et, next task |
| **KISMI** | Bazı kriterler karşılanmamış | ⚠️ Detay sor, devam et |
| **ENGEL VAR** | Blocker nedeniyle tamamlanamadı | 🔴 Çöz, devam et |

---

## 🎯 Başarı Kriterleri

✅ Görevler açık ve net  
✅ Acceptance criteria testlenebilir  
✅ Rapor durum yazılı  
✅ Engeller hızlıca çözülmeli  
✅ Ajanlar paralel çalışabiliyor  

---

## 💡 Kurallar

1. **Başlık:** Action verb ile başla (Write, Create, Build, Design, Test)
2. **Criteria:** SMART format (Specific, Measurable, Achievable, Relevant, Time-bound)
3. **Deadline:** Realistik (task_hours × 1.2)
4. **Rapor:** Acceptance criteria'leri tek tek kontrol et
5. **Engeller:** Hemen bildir, çözüm öner

---

## 🚀 Hazır mısın?

1. ✅ Klasör yapısını anladın
2. ✅ Görev atış template'ini biliyorsun
3. ✅ Rapor yazış template'ini biliyorsun
4. ✅ İş akışını anladın

**Şimdi başla:** Ilk görev'i at!

```bash
# Görev dosyası oluştur
cat > workspace/inbox/frontend_developer/task.md << 'EOF'
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** 2026-04-21  
**Öncelik:** Yüksek  
**Deadline:** 2026-04-23  

### 📝 Açıklama
[Açıklama]

### ✅ Kabul Kriterleri
- [ ] Kriter 1
- [ ] Kriter 2

---
**Status:** Atanmış  
**Alıcı:** Frontend Developer
EOF
```

---

## 📚 Daha Fazla Bilgi

- **Detaylı Rehber:** [README.md](README.md)
- **Workflow:** [WORKFLOW.md](WORKFLOW.md)
- **Format Kuralları:** [FORMAT_GUIDE.md](FORMAT_GUIDE.md)
- **Araçlar:** [TOOLS.md](TOOLS.md)

---

**Başlama Süresi:** 2 dakika ⏱️  
**Kurulum Süresi:** 0 dakika ✅ (Hepsi kurulu)  
**İlk Döngü:** 24-48 saat ⏳

> 💪 **Hazırız! Başlayalım!**
