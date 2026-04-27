# /project:assign-task — Görev Atama Komutu

**Kullanım:** Team Lead tarafından ekibe görev atamak için  
**Syntax:** `/project:assign-task <rol> "<görev_başlığı>"`  
**Tekrar Çalıştırma:** Evet, her görev için

---

## Örnek Kullanımlar

### Basit Görev Atama
```
/project:assign-task po "User story'leri yazıncı"
```

### Detaylı Görev (Açıklamayla)
```
/project:assign-task frontend "Login sayfası oluştur"
Açıklama: Vue 3 + Pinia ile login form'u yapın. Email/password validation ekleyin.
Teslim: 2 saat
```

---

## Sistem Tarafından Yapılanlar

Komut çalıştığında otomatik olarak:

1. **INBOX dosyası oluşturur**
   - Konum: `docs/reports/INBOX/<rol>_task.md`
   - Format: Standart görev template'i

2. **Görev Detaylarını Yazar**
   ```markdown
   ## 📋 Görev: <Başlık>
   **Atayan:** Team Lead
   **Tarih:** 22 Nisan 2026
   **Öncelik:** Normal
   
   ### Açıklama
   <Kullanıcının verdiği açıklama>
   
   ### Kabul Kriterleri
   - [ ] Temel kriterler (sistem tarafından)
   - [ ] Diğer kriterler (varsa)
   
   ### Notlar
   <Ek bilgi>
   ```

3. **Ajana Bilgi Verir**
   - Sağdaki panele görev geldiğini haber verir

---

## Roller (Hedef Ajanlar)

| Komut | Rol | Yazı Alanı |
|-------|-----|-----------|
| `/project:assign-task po` | Product Owner | `docs/requirements/` |
| `/project:assign-task uiux` | UI/UX Designer | `frontend/src/styles/` + `docs/design/` |
| `/project:assign-task frontend` | Frontend Developer | `frontend/src/` + `tests/frontend/` |
| `/project:assign-task backend` | Backend Developer | `backend/` + `tests/backend/` |
| `/project:assign-task qa` | QA Engineer | `tests/` (tüm) |

---

## Görev Yazı Kuralları

### PO Görevleri Örneği
```
/project:assign-task po "Sprint 1 backlog'u oluştur"
Açıklama: 
- 5-10 user story yaz
- Her story'nin acceptance criteria'sı olsun
- Prioritation: Must/Should/Could/Won't
Teslim: 3 saat
```

### Frontend Görevleri Örneği
```
/project:assign-task frontend "Header component'ini yap"
Açıklama:
- Vue 3 Composition API + <script setup>
- Responsive design
- Dark mode support
Teslim: 2 saat
```

### Backend Görevleri Örneği
```
/project:assign-task backend "User modeli ve API endpoints"
Açıklama:
- Django model: User (email, password, name)
- DRF endpoints: POST /auth/register, /auth/login
- JWT authentication
Teslim: 3 saat
```

---

## Başarısızlık Durumu

Eğer görev atanmadıysa:

1. **Rol adı yanlışsa:**
   ```
   ❌ /project:assign-task devfrontend "..."
   ✅ /project:assign-task frontend "..."
   ```

2. **Dosya yazma hatasıysa:**
   - `docs/reports/INBOX/` klasörünün var olduğunu kontrol et
   - Team Lead'in bu klasöre yazma izni var mı kontrol et

3. **Görev başlığı çok uzunsa:**
   - Başlığı kısalt (max 60 karakter)

---

## İlgili Komutlar

- [`/project:start-team`](./project_start_team.md) — Ekibi başlat
- [`/project:team-status`](./project_team_status.md) — Takım durumunu gör
- [`/project:activate <rol>`](./project_activate.md) — Rola bağlan

---

**Status:** Görev atama ✅  
**Referans:** [CLAUDE.md - Görev Akışı](../CLAUDE.md#-görev-akışı)
