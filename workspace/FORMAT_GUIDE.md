# 📝 Görev ve Rapor Format Rehberi

## 📋 GÖREV FORMAT (Task)

### Dosya Konumu
`workspace/inbox/{role}/task.md`

### Yapısı

```markdown
## 📋 Görev: [Başlık - Action Verb ile başla]

**Atayan:** [Team Lead / Diğer Rol]  
**Tarih:** [Atama tarihi - YYYY-MM-DD]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Hedef tarihi - YYYY-MM-DD]  

### 📝 Açıklama
[Görevin detaylı açıklaması (2-3 paragraf)]

### ✅ Kabul Kriterleri
- [ ] Kriter 1 (Measurable)
- [ ] Kriter 2 (Specific)
- [ ] Kriter 3 (Achievable)

### 🔗 Bağımlılıklar
- [ ] Bağımlılık 1 - Durum
- [ ] Bağımlılık 2 - Durum

### 📎 Kaynaklar
- [Link 1](url)
- [Link 2](url)

### 💬 Notlar
[İpuçları, kısıtlamalar, özel gereksinimler]

---
**Status:** Atanmış  
**Alıcı:** [Rol adı]  
**Tahmin:** [Saat sayısı]
```

### Yazma Kuralları

| Alan | Kural |
|------|-------|
| **Başlık** | Action verb (Write, Create, Build, Design, Test, Review) + Object |
| **Açıklama** | WHAT (ne yapılmalı), WHY (neden), HOW (kısaca) |
| **Acceptance Criteria** | Minimum 3, SMART format, testlenebilir |
| **Bağımlılıklar** | [ ] ile başla, durum belirt (Done/In Progress/Blocked) |
| **Deadline** | Realistic, task complexity × 1.2 |

### Örnekler

✅ **İyi Görev:**
```markdown
## 📋 Görev: Write API Documentation for User Authentication Endpoints

**Atayan:** Team Lead  
**Tarih:** 2026-04-21  
**Öncelik:** Yüksek  
**Deadline:** 2026-04-24  

### 📝 Açıklama
Django REST Framework backend'de yazılan authentication endpoint'lerinin 
OpenAPI standardında dokümantasyonunu oluştur. Frontend ve mobile developer'lar 
bu dokümantasyonu referans alacak.

### ✅ Kabul Kriterleri
- [ ] OpenAPI 3.0.0 spec dosyası oluşturuldu
- [ ] Request/Response örnekleri tamamlandı
- [ ] Error case'ler dokümante edildi
- [ ] Swagger UI'da görülebiliyor

**Status:** Atanmış  
**Alıcı:** Backend Developer
```

❌ **Kötü Görev:**
```markdown
## 📋 Görev: API Dokumanı

**Atayan:** Team Lead  
**Tarih:** Bugün  
**Deadline:** ASAP  

### 📝 Açıklama
API'yi dokümante et.

### ✅ Kabul Kriterleri
- [ ] Bitti
```

---

## ✅ RAPOR FORMAT (Report)

### Dosya Konumu
`workspace/outbox/{role}/report.md`

### Yapısı

```markdown
## ✅ Tamamlanan: [Aynı başlık]

**Tamamlayan:** [Rol adı]  
**Tarih:** [Tamamlama tarihi - YYYY-MM-DD]  
**Durum:** [TAMAMLANDI / KISMI / ENGEL VAR]  
**Effort:** [Gerçek saat sayısı]  

### 🎯 Yapılanlar
- Yapılan iş 1
- Yapılan iş 2
- Yapılan iş 3

### 📁 Oluşturulan/Değiştirilen Dosyalar
- `path/to/created_file.py`
- `path/to/modified_file.vue`

### ⚠️ Engeller (varsa)
- **Engel 1:** Açıklama
  - Çözüm: Önerilen çözüm
  - Status: Bekleniyor / Çözülüyor / Çözüldü

- **Engel 2:** Açıklama
  - Çözüm: Önerilen çözüm
  - Status: Bekleniyor / Çözülüyor / Çözüldü

### ✅ Kontrol Listesi
- [x] Acceptance kriter 1 ✅
- [x] Acceptance kriter 2 ✅
- [x] Acceptance kriter 3 ✅
- [x] Code review geçti
- [x] Test'ler pass etti
- [x] Dokümantasyon güncellendi

### 📊 Metrikler (varsa)
- Test coverage: [%]
- Performance: [metric]
- Quality score: [metric]

### 💬 Notlar
[Learning'ler, improvement suggestion'lar, next step'ler, vb.]

---
**Onay:** [İmza / Team Lead]  
**Merge:** main branch / [Branch adı]  
**Next:** [Sonraki görev önerisi]
```

### Yazma Kuralları

| Alan | Kural |
|------|-------|
| **Başlık** | Task'taki başlıkla aynı olmalı |
| **Durum** | TAMAMLANDI / KISMI / ENGEL VAR |
| **Yapılanlar** | Bullet points, bullet sayısı ≥ 3 |
| **Dosyalar** | Relative path, `backtick` ile |
| **Engeller** | Açıklama + Çözüm önerisi |
| **Metrikler** | Sayılarla, karşılaştırma varsa |

### Durum Tanımı

| Durum | Anlamı | Kullan Zamanı |
|-------|--------|---------------|
| **TAMAMLANDI** | Tüm acceptance criteria karşılandı | Task tamamen bitmiş, ready for production |
| **KISMI** | Bazı kriterler karşılanmamış | Task %70+'ı bitmiş, some refinement needed |
| **ENGEL VAR** | Blocker'lar nedeniyle tamamlanamadı | External dependency bekleniyor |

### Örnekler

✅ **İyi Rapor:**
```markdown
## ✅ Tamamlanan: Write API Documentation for User Authentication Endpoints

**Tamamlayan:** Backend Developer  
**Tarih:** 2026-04-23  
**Durum:** TAMAMLANDI  
**Effort:** 6 saat  

### 🎯 Yapılanlar
- OpenAPI 3.0.0 specification dosyası oluşturuldu
- Login, Register, Refresh, Logout endpoint'leri dokümante edildi
- 15+ error case'i tanımlı ve örneklendirildi
- Swagger UI ve ReDoc entegre edildi
- Request/Response örnekleri tamamlandı

### 📁 Oluşturulan Dosyalar
- `backend/docs/openapi.yaml` (350 lines)
- `backend/docs/examples.md`
- Updated `README.md`

### ✅ Kontrol Listesi
- [x] OpenAPI spec valid ✅ (validated)
- [x] Swagger UI çalışıyor ✅
- [x] Tüm endpoint'ler covered ✅
- [x] Error handling documented ✅
- [x] Frontend lead tarafından review geçti ✅

### 📊 Metrikler
- Endpoint sayısı: 4
- Error case'ler: 15
- Coverage: 100%
- Validation: OpenAPI 3.0.0 ✅

### 💬 Notlar
- Frontend lead'in rate limiting hakkında sorusu var
- Mobile team'den feedback: başka authentication method'lar da lazım mı?
- Sonraki adım: API versioning strategy belirlemek

**Onay:** Team Lead  
**Merge:** docs/main  
**Next:** Implement rate limiting documentation
```

❌ **Kötü Rapor:**
```markdown
## ✅ Tamamlanan: API Dokumanı

**Tamamlayan:** Backend Developer  
**Durum:** Bitti  

### 🎯 Yapılanlar
- Dokümantasyon yazıldı
```

---

## 🎯 Acceptance Criteria Yazma

### Kötü Kriterler ❌
- "API endpoint'leri yazılsın"
- "Frontend tamamlansın"
- "Test yapılsın"
- "Hızlı olsun"

### İyi Kriterler ✅
- "POST /api/users/ endpoint'i dağıtan HTTP 201 ile user object dönsün"
- "Login sayfası responsive design'da <1s load time'da açılsın"
- "Unit test coverage ≥ 80% olsun ve CI pass etsin"
- "Lighthouse score ≥ 90 olsun"

### SMART Format

| Harf | Anlamı | Örnek |
|------|--------|-------|
| **S** | Specific (Özgül) | "Login form" değil "User authentication form with email/password" |
| **M** | Measurable (Ölçülebilir) | "Fast" değil "<500ms response time" |
| **A** | Achievable (Ulaşılabilir) | "1 hour" değil "4-6 hours estimated" |
| **R** | Relevant (İlgili) | Backend task için frontend UI criteria değil |
| **T** | Time-bound (Zaman sınırı) | "ASAP" değil "by 2026-04-24 EOD" |

---

## 🔄 Görev ↔ Rapor Eşleştirmesi

```
Task:
## 📋 Görev: Implement User Authentication API Endpoints
- [ ] Create login endpoint
- [ ] Create register endpoint  
- [ ] Add JWT token management

         ↓ (Ajan çalışır)
         
Report:
## ✅ Tamamlanan: Implement User Authentication API Endpoints
- [x] Create login endpoint ✅
- [x] Create register endpoint ✅  
- [x] Add JWT token management ✅
```

---

## ⏱️ Görev Tahmini (Time Estimation)

### Seviyeler

| Seviye | Saat | Örnek |
|--------|------|-------|
| **Trivial** | <1 saat | Typo fix, rename variable, update docs |
| **Small** | 1-2 saat | Simple feature, unit test, bug fix |
| **Medium** | 2-6 saat | Component, API endpoint, integration |
| **Large** | 6-16 saat | Feature set, refactoring, major design |
| **Epic** | 16+ saat | Bölümlenmiş görevler, sprint, phase |

### Tahmin Formülü

```
Buffer = 1.2 × (Best Estimate)

Örnek:
- Best Estimate: 4 saat
- Buffer: 4 × 1.2 = 4.8 saat
- Deadline: Bugün + 5 saat
```

---

**Version:** 1.0  
**Güncelleme:** 21 Nisan 2026  
**Status:** Active
