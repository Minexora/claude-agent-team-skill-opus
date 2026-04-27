# 🤖 Ekip Yönetimi Araçları

## 🔍 Bash Komutları

### 1. Tüm Görevleri Listele

```bash
#!/bin/bash
# tasks.sh - Atanmış tüm görevleri göster

echo "📋 === ATANMIŞ GÖREVLER ==="
echo ""

for role in team_leader product_owner ui_ux_designer frontend_developer backend_developer qa_engineer; do
    task_file="workspace/inbox/$role/task.md"
    if [ -f "$task_file" ]; then
        echo "👤 $role:"
        grep "^## 📋 Görev:" "$task_file" | head -1 | sed 's/## 📋 Görev: /   - /'
        echo ""
    fi
done
```

### 2. Blocker'ları Bul

```bash
#!/bin/bash
# blockers.sh - ENGEL VAR durumundaki görevleri göster

echo "⚠️ === BLOKLENMIŞ GÖREVLER ==="
echo ""

for role in team_leader product_owner ui_ux_designer frontend_developer backend_developer qa_engineer; do
    report_file="workspace/outbox/$role/report.md"
    if grep -q "ENGEL VAR" "$report_file" 2>/dev/null; then
        echo "🔴 $role:"
        grep -A 5 "⚠️ Engeller" "$report_file" | head -6
        echo ""
    fi
done
```

### 3. Durum Özeti

```bash
#!/bin/bash
# status.sh - Tüm görevlerin durumunu göster

echo "📊 === EKIP DURUMU ==="
echo ""

completed=0
partial=0
blocked=0

for report in workspace/outbox/*/report.md; do
    if grep -q "TAMAMLANDI" "$report"; then
        ((completed++))
    elif grep -q "KISMI" "$report"; then
        ((partial++))
    elif grep -q "ENGEL VAR" "$report"; then
        ((blocked++))
    fi
done

echo "✅ Tamamlandi: $completed"
echo "⚠️  Kismi: $partial"
echo "🔴 Engel Var: $blocked"
echo "━━━━━━━━━━━━━━━━━"
echo "📈 Toplam: $((completed + partial + blocked))"
```

### 4. Spesifik Role Raporunu Oku

```bash
#!/bin/bash
# report.sh - Belirtilen rolün raporunu oku

if [ -z "$1" ]; then
    echo "Kullanım: ./report.sh [role]"
    echo "Roller: team_leader, product_owner, ui_ux_designer, frontend_developer, backend_developer, qa_engineer"
    exit 1
fi

report_file="workspace/outbox/$1/report.md"
if [ -f "$report_file" ]; then
    cat "$report_file"
else
    echo "❌ Rapor bulunamadı: $report_file"
fi
```

### 5. Görev'i Ata

```bash
#!/bin/bash
# assign.sh - Yeni görev atama şablonu oluştur

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Kullanım: ./assign.sh [role] [task-title]"
    exit 1
fi

role=$1
title=$2
today=$(date +%Y-%m-%d)
task_file="workspace/inbox/$role/task.md"

cat > "$task_file" << EOF
## 📋 Görev: $title

**Atayan:** Team Lead  
**Tarih:** $today  
**Öncelik:** [Yüksek/Orta/Düşük]  
**Deadline:** [YYYY-MM-DD]  

### 📝 Açıklama
[Açıklama yazı]

### ✅ Kabul Kriterleri
- [ ] Kriter 1
- [ ] Kriter 2

### 🔗 Bağımlılıklar
- [Bağımlılık]

---
**Status:** Atanmış  
**Alıcı:** $role
EOF

echo "✅ Görev oluşturuldu: $task_file"
```

### 6. Raporları Arşivle

```bash
#!/bin/bash
# archive.sh - Tamamlanan raporları arşivle

archive_dir="workspace/archive/$(date +%Y-%m-%d)"
mkdir -p "$archive_dir"

for report in workspace/outbox/*/report.md; do
    if grep -q "TAMAMLANDI" "$report"; then
        role=$(basename $(dirname "$report"))
        cp "$report" "$archive_dir/${role}_report.md"
        rm "$report"
        echo "📦 Arşivlendi: $(basename $report)"
    fi
done

echo "✅ Arşivleme tamamlandı: $archive_dir"
```

---

## 📊 Örnek Kullanım

### Senaryo 1: Yeni Sprint Başlama

```bash
# 1. Günü başlat
./status.sh                    # Önceki sprint durumunu kontrol et

# 2. Yeni görevleri ata
./assign.sh frontend_developer "Implement Login Component"
./assign.sh backend_developer "Create User Authentication API"
./assign.sh qa_engineer "Write Integration Tests"

# 3. Blocker'ları çöz
./blockers.sh                  # Bloklenmiş görevleri bul
./report.sh backend_developer  # Detay bak
```

### Senaryo 2: Günlük Standap

```bash
# 1. Durumu kontrol et
./status.sh

# 2. Blokenleri kontrol et
./blockers.sh

# 3. Tamamlanan görevleri kontrol et
ls -lh workspace/outbox/*/report.md

# 4. Engelleri çöz
cat workspace/outbox/frontend_developer/report.md | grep -A 5 "⚠️"
```

### Senaryo 3: Haftalık Özet

```bash
# 1. Tüm rapotları oku
for report in workspace/outbox/*/report.md; do
    echo "=== $(basename $(dirname $report)) ==="
    cat "$report"
    echo ""
done

# 2. Arşivle
./archive.sh

# 3. Yeni sprint için hazırla
mkdir -p workspace/inbox/team_leader
```

---

## 🎯 CI/CD Entegrasyonu

### GitHub Actions Örneği

```yaml
name: Team Workflow Validation

on:
  schedule:
    - cron: '0 9,17 * * 1-5'  # Pazartesi-Cuma, 09:00 ve 17:00

jobs:
  check-blockers:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Find blockers
        run: |
          blockers=$(grep -r "ENGEL VAR" workspace/outbox/ || true)
          if [ ! -z "$blockers" ]; then
            echo "⚠️ Bloklenmiş görevler bulundu:"
            echo "$blockers"
            exit 1
          fi
      
      - name: Validate formats
        run: |
          # Tüm task.md ve report.md dosyalarını kontrol et
          for file in $(find workspace -name "*.md"); do
            if ! grep -q "Status:" "$file"; then
              echo "❌ Format hatası: $file"
              exit 1
            fi
          done
      
      - name: Send Slack notification
        if: failure()
        uses: 8398a7/action-slack@v3
        with:
          status: ${{ job.status }}
          text: 'Bloklenmiş görevler veya format hataları bulundu!'
          webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

---

## 📈 Metrik Takibi

### Haftalık Rapor Template

```bash
#!/bin/bash
# weekly_report.sh

week=$(date +%W)
year=$(date +%Y)

echo "📊 === HAFTALIK RAPOR (Hafta $week, $year) ===" > workspace/reports/weekly_$week.md
echo "" >> workspace/reports/weekly_$week.md
echo "**Tarih:** $(date +%Y-%m-%d)" >> workspace/reports/weekly_$week.md
echo "" >> workspace/reports/weekly_$week.md

echo "## ✅ Tamamlanan" >> workspace/reports/weekly_$week.md
grep -r "TAMAMLANDI" workspace/outbox/*/report.md | wc -l >> workspace/reports/weekly_$week.md

echo "## ⚠️ Kısmi" >> workspace/reports/weekly_$week.md
grep -r "KISMI" workspace/outbox/*/report.md | wc -l >> workspace/reports/weekly_$week.md

echo "## 🔴 Engel Var" >> workspace/reports/weekly_$week.md
grep -r "ENGEL VAR" workspace/outbox/*/report.md | wc -l >> workspace/reports/weekly_$week.md

cat workspace/reports/weekly_$week.md
```

---

**Version:** 1.0  
**Güncelleme:** 21 Nisan 2026  
**Status:** Active
