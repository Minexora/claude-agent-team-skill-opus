#!/bin/bash

# iTerm2 Team Layout Setup Script
# Bu script iTerm2'de Team Lead (üstte) ve 5 ekip üyesi (altta) olacak şekilde
# paneller oluşturur ve her birinde ilgili claude persona'sını başlatır.

echo "iTerm2 panelleri oluşturuluyor..."

# AppleScript to control iTerm2
osascript <<EOF
tell application "iTerm"
    activate
    
    # Yeni bir pencere aç veya mevcut pencereyi kullan
    if (count of windows) = 0 then
        create window with default profile
    end if
    
    tell current window
        tell current session
            # TEAM LEAD (Mevcut Session - ÜST)
            write text "clear && echo -e '\\033[1;36m[ TEAM LEAD ]\\033[0m' && claude"
            
            # Alt paneller (5 adet)
            
            # 1. PO'yu dikey olarak aşağıya böl
            set po_session to split horizontally with default profile
            
            # PO session içinden diğer 4'ünü yatay olarak böl
            tell po_session
                set fe_session to split vertically with default profile
            end tell
            
            tell fe_session
                set be_session to split vertically with default profile
            end tell
            
            tell be_session
                set ui_session to split vertically with default profile
            end tell
            
            tell ui_session
                set qa_session to split vertically with default profile
            end tell
            
            # Persona'ları başlat
            tell po_session
                write text "clear && echo -e '\\033[1;33m[ PRODUCT OWNER ]\\033[0m' && claude -p agents/product_owner.md"
            end tell
            
            tell fe_session
                write text "clear && echo -e '\\033[1;34m[ FRONTEND DEV ]\\033[0m' && claude -p agents/frontend_dev.md"
            end tell
            
            tell be_session
                write text "clear && echo -e '\\033[1;32m[ BACKEND DEV ]\\033[0m' && claude -p agents/backend_dev.md"
            end tell
            
            tell ui_session
                write text "clear && echo -e '\\033[1;35m[ UI/UX DESIGNER ]\\033[0m' && claude -p agents/uiux_designer.md"
            end tell
            
            tell qa_session
                write text "clear && echo -e '\\033[1;31m[ TESTER / QA ]\\033[0m' && claude -p agents/tester.md"
            end tell
            
        end tell
    end tell
end tell
EOF

echo "Takım hazır!"
