#!/bin/bash

###############################
# iTerm2 Multi-Agent Team Setup
###############################
# Yapı: Sol panel (Team Lead) + Sağ 5 panel (PO, UI/UX, Frontend, Backend, QA)
# Her panel kendi persona'sı ile aktif şekilde açılır.

set -e  # Exit on error

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🚀 iTerm2 Agent Team panelleri oluşturuluyor..."
echo ""

# AppleScript aracılığıyla iTerm2'de panel layoutu kur
osascript <<'APPLESCRIPT'
tell application "iTerm"
    activate
    
    -- Yeni pencere
    if (count of windows) = 0 then
        create window with default profile
    end if
    
    tell current window
        -- ADIM 1: Ana pencereyi dikey split - Sol (Team Lead) | Sağ (5 Panel)
        set left_session to current session
        set right_session to split vertically with default profile
        
        -- ADIM 2: Sağ paneli 5 yatay panel'e böl
        tell right_session
            set po_session to current session
            set ui_ux_session to split horizontally with default profile
        end tell
        
        tell ui_ux_session
            set ui_ux_session_ref to current session
            set frontend_session to split horizontally with default profile
        end tell
        
        tell frontend_session
            set frontend_session_ref to current session
            set backend_session to split horizontally with default profile
        end tell
        
        tell backend_session
            set backend_session_ref to current session
            set qa_session to split horizontally with default profile
        end tell
        
        -- ADIM 3: Her panele başlık ve bootstrap prompt dosyası yükle
        
        -- Team Lead Panel (Sol)
        tell left_session
            write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
            delay 0.2
            write text "echo '🎖️ [TEAM LEAD - Proje Koordinatörü]' && echo ''"
            delay 0.1
            write text "cat prompts/bootstrap_team_leader.md"
        end tell
        
        -- Product Owner Panel (Sağ Üst)
        tell po_session
            write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
            delay 0.2
            write text "echo '📊 [PRODUCT OWNER - Gereksinimler & Backlog]' && echo ''"
            delay 0.1
            write text "cat prompts/bootstrap_product_owner.md"
        end tell
        
        -- UI/UX Designer Panel (Sağ 2.)
        tell ui_ux_session_ref
            write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
            delay 0.2
            write text "echo '🎨 [UI/UX DESIGNER - Tasarım Sistemi]' && echo ''"
            delay 0.1
            write text "cat prompts/bootstrap_ui_ux_designer.md"
        end tell
        
        -- Frontend Developer Panel (Sağ 3.)
        tell frontend_session_ref
            write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
            delay 0.2
            write text "echo '🖥️ [FRONTEND DEV - Vue3 & Pinia]' && echo ''"
            delay 0.1
            write text "cat prompts/bootstrap_frontend_developer.md"
        end tell
        
        -- Backend Developer Panel (Sağ 4.)
        tell backend_session_ref
            write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
            delay 0.2
            write text "echo '⚙️ [BACKEND DEV - Django & DRF]' && echo ''"
            delay 0.1
            write text "cat prompts/bootstrap_backend_developer.md"
        end tell
        
        -- QA Engineer Panel (Sağ 5. / Alt)
        tell qa_session
            write text "cd '" & (system info's home folder) & "/Documents/ClaudeCodeFirstSkill' && clear"
            delay 0.2
            write text "echo '🧪 [QA ENGINEER - Test Otomasyonu]' && echo ''"
            delay 0.1
            write text "cat prompts/bootstrap_qa_engineer.md"
        end tell
    end tell
end tell
APPLESCRIPT

echo ""
echo "✨ Paneller oluşturuldu!"
echo ""
echo "📌 Panel Düzeni:"
echo "  SOL:      🎖️  Team Lead"
echo "  SAĞ:      📊 PO | 🎨 UI/UX | 🖥️ Frontend | ⚙️ Backend | 🧪 QA"
echo ""
echo "💡 Her panel bootstrap prompt dosyasını otomatik açacaktır."
echo "🚀 Sistem ready! Ekip aktif ve görev beklemeye hazırdır."
echo ""
echo "📋 Panel Layout:"
echo "┌─────────────────────────────────────────────────────────┐"
echo "│  TEAM LEAD          │     SAĞ PANEL GRUPLARI           │"
echo "│  (Coordinator)      ├─────────────────────────────────┤"
echo "│                     │  📊 Product Owner               │"
echo "│                     ├─────────────────────────────────┤"
echo "│                     │  🎨 UI/UX Designer              │"
echo "│                     ├─────────────────────────────────┤"
echo "│                     │  🖥️  Frontend Developer           │"
echo "│                     ├─────────────────────────────────┤"
echo "│                     │  ⚙️  Backend Developer            │"
echo "│                     ├─────────────────────────────────┤"
echo "│                     │  🧪 QA Engineer                 │"
echo "└─────────────────────────────────────────────────────────┘"
echo ""
echo "🎯 Her panel açılmıştır ve iş almaya hazırdır."
echo "💡 İpucu: docs/reports/INBOX/ dosyalarına görev yaz"
