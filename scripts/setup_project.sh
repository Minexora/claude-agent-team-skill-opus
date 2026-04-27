#!/bin/bash

# Proje klasör yapısı oluşturma scripti
# CLAUDE.md tarafından tanımlanan standart yapıyı oluşturur

echo "🚀 Proje iskeleti oluşturuluyor..."

# Güvenli dizin oluşturma fonksiyonu
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "✅ Oluşturuldu: $1"
    fi
}

# ============================================
# 1. DOCS (Proje Dokümantasyonu)
# ============================================
echo ""
echo "📚 Dokümantasyon klasörleri..."
create_dir "docs/requirements"      # PO: User story, backlog, criteria
create_dir "docs/design"            # UI/UX: Design system, component guide
create_dir "docs/reports/INBOX"     # Team Lead: Ekibe atanan görevler
create_dir "docs/reports/OUTBOX"    # Ajanlar: Tamamlanmış görev raporları

# ============================================
# 2. FRONTEND (Vue 3 + Pinia)
# ============================================
echo "🖥️  Frontend klasörleri..."
create_dir "frontend/src/assets"
create_dir "frontend/src/styles"    # UI/UX yazacak
create_dir "frontend/src/components"
create_dir "frontend/src/views"
create_dir "frontend/src/stores"    # Pinia state management
create_dir "frontend/src/composables"
create_dir "frontend/src/router"
create_dir "frontend/src/services"
create_dir "frontend/public"

# ============================================
# 3. BACKEND (Django + DRF)
# ============================================
echo "⚙️  Backend klasörleri..."
create_dir "backend/config/settings"
create_dir "backend/apps"
create_dir "backend/requirements"

# ============================================
# 4. TESTS (E2E, Unit, Integration)
# ============================================
echo "🧪 Test klasörleri..."
create_dir "tests/frontend"
create_dir "tests/backend"
create_dir "tests/e2e"

# ============================================
# 5. Temel Dosyalar
# ============================================
echo "📄 Temel dosyalar oluşturuluyor..."
touch docs/project_plan.md
touch docs/requirements/user_stories.md
touch docs/requirements/backlog.md
touch docs/design/design_system.md
touch tests/test_plan.md

# ============================================
# 6. INBOX Template Dosyaları (Team Lead için)
# ============================================
echo "📋 Görev template dosyaları..."

cat << 'EOF' > docs/reports/INBOX/po_task.md
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** [Tarih]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Deadline varsa]  

### 📝 Açıklama
[PO'nun user story, backlog veya acceptance criteria görevinin açıklaması]

### ✅ Kabul Kriterleri
- [ ] Kriter 1
- [ ] Kriter 2

### 🔗 Bağımlılıklar
[Başka görev varsa]

---
**Status:** Atanmış  
**Alıcı:** Product Owner
EOF

cat << 'EOF' > docs/reports/INBOX/frontend_task.md
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** [Tarih]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Deadline varsa]  

### 📝 Açıklama
[Frontend görevinin detaylı açıklaması]

### 🎯 Teknik Gereksinimler
- Framework: Vue 3 (Composition API)
- State: Pinia
- Build: Vite

### ✅ Kabul Kriterleri
- [ ] Component'ler yazıldı
- [ ] Unit test'ler yazıldı
- [ ] API entegrasyonu tamamlandı

### 🔗 Bağımlılıklar
- Design tamamlandı mı?
- Backend endpoint hazır mı?

---
**Status:** Atanmış  
**Alıcı:** Frontend Developer
EOF

cat << 'EOF' > docs/reports/INBOX/backend_task.md
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** [Tarih]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Deadline varsa]  

### 📝 Açıklama
[Backend görevinin detaylı açıklaması]

### 🎯 Teknik Gereksinimler
- Framework: Django + DRF
- Database: PostgreSQL
- Auth: JWT

### ✅ Kabul Kriterleri
- [ ] Model'ler oluşturuldu
- [ ] API endpoint'leri çalışıyor
- [ ] Integration test'ler yazıldı

### 🔗 Bağımlılıklar
[Başka görev varsa]

---
**Status:** Atanmış  
**Alıcı:** Backend Developer
EOF

cat << 'EOF' > docs/reports/INBOX/uiux_task.md
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** [Tarih]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Deadline varsa]  

### 📝 Açıklama
[Design görevinin detaylı açıklaması. Hangi component'ler tasarlanmalı?]

### 🎯 Teknik Gereksinimler
- CSS Modules / SCSS
- Responsive Design
- Accessibility (WCAG)

### ✅ Kabul Kriterleri
- [ ] Design system oluşturuldu
- [ ] Component kılavuzu yazıldı
- [ ] CSS/SCSS kodlanmış

### 🔗 Bağımlılıklar
[Başka görev varsa]

---
**Status:** Atanmış  
**Alıcı:** UI/UX Designer
EOF

cat << 'EOF' > docs/reports/INBOX/qa_task.md
## 📋 Görev: [Başlık]

**Atayan:** Team Lead  
**Tarih:** [Tarih]  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [Deadline varsa]  

### 📝 Açıklama
[QA/Tester'ın test görevinin detaylı açıklaması]

### 🎯 Test Türleri
- Unit test'ler
- Integration test'leri
- E2E test'leri

### ✅ Kabul Kriterleri
- [ ] Test plan yazıldı
- [ ] Test case'ler oluşturuldu
- [ ] Test raporları hazırlandı

### 🔗 Bağımlılıklar
- Backend geliştirme tamamlandı mı?
- Frontend geliştirme tamamlandı mı?

---
**Status:** Atanmış  
**Alıcı:** QA Engineer
EOF

# ============================================
# 7. OUTBOX Template Dosyaları (Ajanlar için)
# ============================================
echo "📤 Rapor template dosyaları..."

cat << 'EOF' > docs/reports/OUTBOX/README.md
# OUTBOX — Tamamlanan Görev Raporları

Ajanlar tamamladıkları görevleri buraya rapor yazarlar:
- `po_done.md` — Product Owner'ın tamamladığı görev raporları
- `frontend_done.md` — Frontend Developer'ın raporları
- `backend_done.md` — Backend Developer'ın raporları
- `uiux_done.md` — UI/UX Designer'ın raporları
- `qa_done.md` — QA Engineer'ın raporları

Team Lead bu raporları günlük takip eder ve engeller çözer.
EOF

# ============================================
# 8. İletişim README
# ============================================
cat << 'EOF' > docs/reports/README.md
# 📊 Ekip İletişim & Görev Yönetimi

## 📋 INBOX — Gelen Görevler
Team Lead'in atadığı görevler:
- `po_task.md` — Product Owner görevleri
- `frontend_task.md` — Frontend Developer görevleri
- `backend_task.md` — Backend Developer görevleri
- `uiux_task.md` — UI/UX Designer görevleri
- `qa_task.md` — QA Engineer görevleri

## 📤 OUTBOX — Giden Raporlar
Ajanların tamamladıkları görev raporları. Her rapor SMART kriterlerle ve engel takibiyle yazılır.

## 🔄 İş Akışı
1. Team Lead → INBOX/{rol}/task.md dosyası yazar
2. Ajan → Görevi oku, bağımlılıkları kontrol et
3. Ajan → İş yap, test et
4. Ajan → OUTBOX/{rol}/report.md rapor yaz
5. Team Lead → Raporu oku, blocker çöz

## 🛑 Blocker Yönetimi
Raporda "**Durum: ENGEL VAR**" görürse:
- Team Lead sorunun açıklamasını okur (Engeller bölümü)
- Sorun çözer veya kullanıcıya eskalasyon yapar
- Çözüldüğünde ajan'a haber verir
EOF

echo ""
echo "✨ Proje altyapısı TAMAMLANDI!"
echo ""
echo "📌 Sonraki Adımlar:"
echo "  1. CLAUDE.md dosyasını oku (sistem tanımı)"
echo "  2. Team Lead: docs/project_plan.md yaz"
echo "  3. Team Lead: docs/reports/INBOX/ dosyalarını doldur"
echo "  4. Ekip: docs/reports/OUTBOX/ klasörlerini izle"
echo ""
echo "🚀 Sistem ready!"
