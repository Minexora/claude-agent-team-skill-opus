#!/bin/bash

# Proje klasör yapısı oluşturma scripti

echo "Proje iskeleti oluşturuluyor..."

# Güvenli dizin oluşturma fonksiyonu
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "✅ Oluşturuldu: $1"
    fi
}

# 1. Ana Klasörler
create_dir "docs/requirements"
create_dir "docs/design"
create_dir "docs/reports/INBOX"
create_dir "docs/reports/OUTBOX"
create_dir "frontend/src/assets"
create_dir "frontend/src/styles"
create_dir "frontend/src/components"
create_dir "frontend/src/views"
create_dir "frontend/src/stores"
create_dir "frontend/src/composables"
create_dir "frontend/src/router"
create_dir "frontend/src/services"
create_dir "frontend/public"
create_dir "backend/config/settings"
create_dir "backend/apps"
create_dir "backend/requirements"
create_dir "tests/frontend"
create_dir "tests/backend"
create_dir "tests/e2e"

# 2. Temel Şablon Dosyaları Dokundur
touch docs/project_plan.md
touch docs/requirements/user_stories.md
touch docs/requirements/backlog.md
touch docs/design/design_system.md
touch tests/test_plan.md

# 3. İletişim README
cat << 'EOF' > docs/reports/README.md
# Ekip İletişim Dizini
Bu klasör ekip içi görev atama ve tamamlama raporlarını barındırır.
- **INBOX:** Team Lead'in atadığı görevler buraya yazılır.
- **OUTBOX:** Ekip üyeleri tamamladıkları görevleri buraya yazarlar.
EOF

echo "✨ Proje altyapısı hazırlandı!"
echo "Şimdi CLAUDE.md yönergelerini takip ederek tasarıma/geliştirmeye başlayabilirsiniz."
