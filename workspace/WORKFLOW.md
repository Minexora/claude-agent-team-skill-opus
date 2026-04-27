# 📋 Dosya Tabanlı Görev Akışı (File-Based Workflow)

## 🎯 Amaç

Ekip üyelerinin bağımsız ve paralel çalışabilmesi için **dosya tabanlı iletişim sistemi**. 

- **Team Lead** → görevleri `workspace/inbox/{role}/` klasöründe bırakır
- **Ajanlar** → `workspace/inbox/{role}/` klasöründen görevlerini alırlar
- **Ajanlar** → tamamlanan işleri `workspace/outbox/{role}/` klasörüne raporlarlar
- **Team Lead** → `workspace/outbox/{role}/` klasöründen raporları okur ve takip eder

---

## 📁 Klasör Yapısı

```
workspace/
├── inbox/                          # Gelen görevler
│   ├── team_leader/
│   ├── product_owner/
│   ├── ui_ux_designer/
│   ├── frontend_developer/
│   ├── backend_developer/
│   └── qa_engineer/
├── outbox/                         # Giden raporlar
│   ├── team_leader/
│   ├── product_owner/
│   ├── ui_ux_designer/
│   ├── frontend_developer/
│   ├── backend_developer/
│   └── qa_engineer/
└── archive/                        # Tamamlanan işler (opsiyonel)
    └── [YYYY-MM-DD]/
```

---

## 🔄 İş Akışı

### 1️⃣ Team Lead Görev Atıyor

**Neresi:** `workspace/inbox/{role}/task.md`

```markdown
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** [Tarih]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Deadline varsa]  

### 📝 Açıklama
[Görevin detaylı açıklaması]

### ✅ Kabul Kriterleri
- [ ] Kriter 1
- [ ] Kriter 2

### 🔗 Bağımlılıklar
- [Başka görev]

---
**Status:** Atanmış  
**Alıcı:** [Rol adı]
```

**Format Kuralları:**
- Başlık açık ve özlü olmalı
- Kabul kriterleri SMART olmalı (Specific, Measurable, Achievable, Relevant, Time-bound)
- Bağımlılıkları açıkça belirt (Blocker'lar)
- Deadline kesin olmalı

### 2️⃣ Ajan Görevi Okur ve Yapıyor

**Neresi:** `workspace/inbox/{role}/task.md`

- Görev okunur
- Kabul kriterleri kontrol edilir
- Bağımlılıklar doğrulanır
- İş yapılır

### 3️⃣ Ajan İşi Tamamlayıp Rapor Yazıyor

**Neresi:** `workspace/outbox/{role}/report.md`

```markdown
## ✅ Tamamlanan: [Başlık]

**Tamamlayan:** [Rol]  
**Tarih:** [Tarih]  
**Durum:** [TAMAMLANDI/KISMI/ENGEL VAR]  

### 🎯 Yapılanlar
- Yapılan iş 1
- Yapılan iş 2

### 📁 Oluşturulan Dosyalar
- `path/to/file.md`

### ⚠️ Engeller (varsa)
- Blocker 1: Açıklaması

### 💬 Notlar
[Ek bilgiler]

---
**Status:** Tamamlandı  
**Onay:** [İmza/Taraf]
```

**Format Kuralları:**
- **TAMAMLANDI:** Tüm acceptance criteria karşılanmış
- **KISMI:** Bazı kriterler karşılanmamış
- **ENGEL VAR:** Blocker'lar nedeniyle yarıda kalınmış
- Oluşturulan dosyaları tam path ile listele
- Engeller açık ve çözüm önerileri sun

### 4️⃣ Team Lead Raporu Okur ve Takip Eder

**Neresi:** `workspace/outbox/{role}/report.md`

- Raporları kontrol et
- Blocker'ları çöz veya eskalasyonu yap
- Sonraki görev'i hazırla
- Ekip durumunu güncelle

---

## 👥 Rol Spesifik Formatlar

### 🎖️ Team Lead

**Görev Atma (INBOX):**
- Proje planı, sprint goals, ekip koordinasyonu
- Diğer tüm ajanlardan gelen raporları okur
- Takım durumunu özetler

**Rapor Yazma (OUTBOX):**
- Ekip durumu özeti
- Blocker'lar ve çözümleri
- Sonraki adımlar

---

### 📊 Product Owner

**Görev (INBOX):**
- User story yazma
- Requirements belirleme
- Backlog oluşturma
- Acceptance criteria tanımlama

**Rapor (OUTBOX):**
- User story'ler
- Backlog listeleri
- Sprint planning
- Pazarlama feedback'i

---

### 🎨 UI/UX Designer

**Görev (INBOX):**
- Design system oluşturma
- Component kılavuzu hazırlama
- Color/Typography belirleme
- Mockup'lar yapma

**Rapor (OUTBOX):**
- Design system dosyaları
- CSS/SCSS kodları
- Figma linkler
- Component dokümantasyonu

---

### 🖥️ Frontend Developer

**Görev (INBOX):**
- Component yazma (Vue3)
- State management (Pinia)
- API entegrasyonu
- Test yazma

**Rapor (OUTBOX):**
- Oluşturulan component'ler
- Test raporu
- Performance metrikler
- Code review durumu

---

### ⚙️ Backend Developer

**Görev (INBOX):**
- API endpoint'leri yazma
- Model'ler oluşturma
- Database migration'lar
- Test yazma

**Rapor (OUTBOX):**
- Oluşturulan endpoint'ler
- Database schema
- Test raporu
- Performance metrikler

---

### 🧪 QA Engineer

**Görev (INBOX):**
- Test plan oluşturma
- Test case'leri yazma
- Bug tracking
- Quality kontrol

**Rapor (OUTBOX):**
- Test raporu
- Bulunan hatalar
- Coverage metrikler
- Release readiness

---

## ⏱️ Görev Yaşam Döngüsü

| Aşama | Dosya | Durum | Açıklama |
|-------|-------|-------|----------|
| 1. Atama | `inbox/{role}/task.md` | **Atanmış** | Team Lead tarafından yazıldı |
| 2. Çalışma | `inbox/{role}/task.md` | **Devam Ediyor** | Ajan çalışıyor |
| 3. Tamamlama | `outbox/{role}/report.md` | **TAMAMLANDI** | Ajan rapor verdi |
| 4. Onay | `outbox/{role}/report.md` | **Onaylandı** | Team Lead onayladı |
| 5. Arşiv | `archive/[YYYY-MM-DD]/report.md` | **Arşivlendi** | (Opsiyonel) |

---

## 🛠️ Komut Satırı Yardımcıları

### Tüm Görevleri Listele

```bash
# Atanmış görevler
find workspace/inbox -name "task.md" -exec ls -lh {} \;

# Tamamlanan raporlar
find workspace/outbox -name "report.md" -exec ls -lh {} \;
```

### Spesifik Rol'ün Görevini Kontrol Et

```bash
# Frontend Developer'ın görevini gör
cat workspace/inbox/frontend_developer/task.md

# Frontend Developer'ın raporunu gör
cat workspace/outbox/frontend_developer/report.md
```

### Blocker'ları Bulma

```bash
# "ENGEL VAR" durumu olan tüm raporları bul
grep -r "ENGEL VAR" workspace/outbox/
```

### Tamamlanan İşleri Arşivle

```bash
# Arşiv klasörüne taşı
mkdir -p workspace/archive/$(date +%Y-%m-%d)
mv workspace/outbox/*/report.md workspace/archive/$(date +%Y-%m-%d)/
```

---

## 📋 Kontrol Listesi

### Team Lead'in Günlük Yapması Gerekenler

- [ ] `workspace/inbox/*/task.md` yeni görev var mı?
- [ ] Yeni görev'ler atandı mı?
- [ ] `workspace/outbox/*/report.md` yeni rapor var mı?
- [ ] Raporları oku ve durum kontrol et
- [ ] Blocker'lar için harekete geçti mi?
- [ ] Sonraki görev'leri hazırla

### Ajan'ın Görev Alırken Yapması Gerekenler

- [ ] `workspace/inbox/{role}/task.md` oku
- [ ] Acceptance criteria'yi anladı mı?
- [ ] Bağımlılıklar tamamlandı mı?
- [ ] Deadline'ı not ettim?
- [ ] Sorular varsa Team Lead'e sor

### Ajan'ın Rapor Yazarken Yapması Gerekenler

- [ ] Tüm acceptance criteria'leri karşıladım?
- [ ] Oluşturulan dosyaları listeledin?
- [ ] Test sonuçları yazdı?
- [ ] Engeller varsa belirttin?
- [ ] Kalite kontrol'ü yaptım?
- [ ] `workspace/outbox/{role}/report.md` gönder

---

## 💡 İpuçları

1. **Görev Adı:** Başlıklar action verb ile başlamalı (Write, Create, Implement, Design, etc.)
2. **Deadline:** Gerçekçi deadline'lar belirleme (Task complexity × 1.2)
3. **Bağımlılıklar:** Paralel çalışmayı artırmak için bağımlılıkları minimize et
4. **Rapor Sıklığı:** Kritik görevler için günlük rapor, normal görevler için haftalık
5. **Blocker İletişimi:** ENGEL VAR durumunu hemen bildir, çözmek için bekle

---

## 🎯 Başarı Kriterleri

✅ **Bağımsız Çalışma:** Ajanlar paralel çalışabilmeli  
✅ **Görünürlük:** Herkes ekip durumunu görebilmeli  
✅ **Hız:** Görev-rapor döngüsü ≤ 24 saat  
✅ **Kalite:** Acceptance criteria'ler net olmalı  
✅ **Takip:** Blocker'lar hızlıca çözülmeli  

---

**Version:** 1.0  
**Güncelleme:** 21 Nisan 2026  
**Status:** Active
