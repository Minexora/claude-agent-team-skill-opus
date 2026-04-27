# /project:assign-task

## Purpose
Belirli bir role (PO, Frontend Developer, Backend Developer, UI/UX Designer, QA Engineer) görev atar. Görev `docs/reports/INBOX/<rol>_task.md` dosyasında kaydedilir ve ilgili ajan panelinde görür.

Takım Lead olarak bu komutu her zaman kullanır:
- İlk sprint'in başlangıcında
- Önceki görev tamamlandığında
- Acil görev ataması gerektiğinde
- Blocker'ı çözmek için

---

## Input

### Komut Parametreleri

1. **Rol** (zorunlu, string)
   - Seçenekler: `po`, `frontend`, `backend`, `uiux`, `qa`
   - Örn: `/project:assign-task "Frontend Developer" "..."`

2. **Görev Başlığı** (zorunlu, string)
   - Örn: `"Login ekranı componentini tasarla"`

3. **Görev Açıklaması** (zorunlu, markdown text)
   - Ayrıntılı açıklama

4. **Kabul Kriterleri** (zorunlu, liste)
   - En az 2-3 başarı kriteri

5. **Öncelik** (opsiyonel, default: "Orta")
   - Seçenekler: `Düşük`, `Orta`, `Yüksek`, `Kritik`

6. **Bağımlılıklar** (opsiyonel)
   - Diğer roller tarafından yapılması gerekenler

### Örnek Kullanım
```
/project:assign-task Frontend Developer
Görev: Login Ekranı Tasarımı
Açıklama: Bootstrap'ı kullanarak... 
Kriterler:
  - [ ] Responsive tasarım
  - [ ] Pinia store'u
Öncelik: Yüksek
Bağımlılıklar: Backend: /auth endpoint hazır
```

---

## Behavior

### 1. Rol Validasyonu
Verilen rol geçerli mi kontrol et:
```
Geçerli Roller:
- "Product Owner" / "po"
- "Frontend Developer" / "frontend"
- "Backend Developer" / "backend"
- "UI/UX Designer" / "uiux"
- "QA Engineer" / "qa"
```

**Hata:** Geçerli olmayan rol ise:
```
❌ Rol tanımlanamadı. Geçerli roller:
  - Frontend Developer
  - Backend Developer
  - Product Owner
  - UI/UX Designer
  - QA Engineer
```

### 2. Dosya Oluştur/Güncelle
`docs/reports/INBOX/<rol_kısa>_task.md` dosyasını oluştur:

```markdown
## 📋 Görev: <Başlık>
**Atayan:** Team Lead  
**Tarih:** 21 Nisan 2026  
**Öncelik:** <Yüksek/Orta/Düşük/Kritik>

### Açıklama
<Görevin detaylı açıklaması>

### Kabul Kriterleri
- [ ] <Kriter 1>
- [ ] <Kriter 2>
- [ ] <Kriter 3>

### Bağımlılıklar
<Eğer varsa, hangi rollerin ne yapması gereği>

### Notlar
<Varsa ek bilgiler>
```

**Dosya Isimlendirme:**
- Product Owner → `po_task.md`
- Frontend Developer → `frontend_task.md`
- Backend Developer → `backend_task.md`
- UI/UX Designer → `uiux_task.md`
- QA Engineer → `qa_task.md`

### 3. Eski Görev Raporunu Temizle (opsiyonel)
İlgili rolün `docs/reports/OUTBOX/<rol>_done.md` dosyası varsa başa şu notu ekle:
```
**[GÖRÜLDÜ - Yeni Görev Atandı]**
---
```

### 4. Bildirim
```
✅ Görev atandı!
👤 Rol: <Rol Adı>
📝 Başlık: <Görev Başlığı>
📥 Dosya: docs/reports/INBOX/<rol>_task.md
⏱️ Atanma Tarihi: [Tarih]
```

---

## Output

### Oluşturulan/Güncellenen Kaynaklar

1. **Görev Dosyası**
   - `docs/reports/INBOX/<rol>_task.md` oluşturuldu/güncellendi
   - Tüm parametreler ve kriterler eklenmiş

2. **Görüntülenme**
   - İlgili ajan panelinin takip sistemi tarafından görülebilir
   - Ajan kendi INBOX'ını takip eder (otomatik sistem)

3. **Status**
   - Team Lead: Görev başarıyla atandı
   - İlgili Ajan: Yeni görev aldı, başlamaya hazır

### Başarı Yanıtı Örneği
```
✅ Frontend Developer'a görev atandı!
📝 "Login Ekranı Tasarımı"
📥 İlgili ajan panelinden görevini görebilir
⏱️ Tahmini Süre: 2 gün
```

### Hata Yanıtları
```
❌ Rol tanımlanamadı. Lütfen geçerli bir rol seç.

❌ Görev başlığı çok kısa. En az 5 kelime gir.

❌ Kabul kriterleri yoksa görev atanamaz. En az 2 kriter ekle.
```

---

**Komut:** `/project:assign-task`  
**Takım Lead Sorumluluğu:** Görev açıklığını ve kriterlerini net yazması  
**Ajan Sorumluluğu:** Dosyayı okumak ve INBOX takip sistemi  
**Durum:** Production  
**Son Güncelleme:** 21 Nisan 2026
