# /project:activate — Rola Bağlan / Panel Geç

**Kullanım:** Herhangi bir panele (ajana) bağlanmak için  
**Syntax:** `/project:activate <rol_adı>`  
**Sıklık:** İsteğe bağlı

---

## Roller

| Komut | Panel | Rol |
|-------|-------|-----|
| `/project:activate team-lead` | Sol | Team Lead |
| `/project:activate po` | Sağ-1 | Product Owner |
| `/project:activate uiux` | Sağ-2 | UI/UX Designer |
| `/project:activate frontend` | Sağ-3 | Frontend Developer |
| `/project:activate backend` | Sağ-4 | Backend Developer |
| `/project:activate qa` | Sağ-5 | QA Engineer |

---

## Örnek Kullanımlar

### Team Lead'e bağlan (Sol Panel)
```
/project:activate team-lead
```
Çıktı:
```
🎖️ Team Lead Panel'ine bağlanıldı

Aksiyon yapabilirsiniz:
- INBOX dosyalarını yaz
- OUTBOX raporlarını oku
- Yeni görevler ata
- Takım durumunu kontrol et
```

### Product Owner'a bağlan
```
/project:activate po
```
Çıktı:
```
📋 Product Owner Panel'ine bağlanıldı

Aksiyon yapabilirsiniz:
- User story yaz
- Backlog oluştur
- Acceptance criteria belirle
- OUTBOX raporını yaz (po_done.md)
```

### Frontend Developer'a bağlan
```
/project:activate frontend
```
Çıktı:
```
🖥️ Frontend Developer Panel'ine bağlanıldı

Aksiyon yapabilirsiniz:
- INBOX görevini oku (frontend_task.md)
- Vue 3 component yazma başla
- API service yaz
- Component test'leri yaz
- OUTBOX raporunu yaz (frontend_done.md)
```

---

## Panel Bağlantısı Nasıl Çalışır?

1. **Komutu Çalıştır**
   ```
   /project:activate frontend
   ```

2. **Sistem Kontrol Eder**
   - frontend panel'inin açık olduğunu doğrula
   - Bootstrap'ı kontrol et

3. **Panel Geçişi Yapılır**
   - iTerm2'de sağ panel 3'e geç
   - Frontend Developer prompt'u göster
   - Standby'de ise alert ver

4. **İşlem Devam Et**
   - INBOX görevini oku
   - Çalışmaya devam et

---

## Panel Durumları

### ✅ Panel Aktif
```
✅ frontend panel aktif
   Status: Çalışıyor
   PID: 12345
   CPU: Normal
   
Bağlantı kuruldu. Devam edebilirsiniz.
```

### 🟡 Panel Açık ama İdle
```
🟡 frontend panel aktif (bekleme modunda)
   Status: Standby
   Son aktivite: 5 dakika önce
   
Bağlantı kuruldu. Yeni görev atanmış, kontrol edin.
```

### ❌ Panel Offline
```
❌ frontend panel bulunamadı

Çözüm:
1. Panel'i açmak için: /project:start-team
2. Manual açmak için: ./scripts/setup_iterm2.sh
3. Tekrar dene: /project:activate frontend
```

---

## Hızlı Aktivasyon Örnekleri

### Tüm Ajanları Dolaş (Status Kontrol)
```
/project:activate team-lead   # "Görevler atandı mı?" kontrol et
/project:activate po           # "Backlog hazır mı?" kontrol et
/project:activate uiux        # "CSS yapıldı mı?" kontrol et
/project:activate frontend    # "Componentler yok mu engeli?" kontrol et
/project:activate backend     # "Models hazır mı?" kontrol et
/project:activate qa          # "Test framework ready?" kontrol et
```

### Engel Çözme
```
# Frontend CSS engeli oldu

/project:activate uiux        # UI/UX panel'ine git
                              # CSS dosyasını hızlandır

/project:activate frontend    # Frontend panel'ine dön
                              # Devam et
```

---

## İlgili Komutlar

- [`/project:list-agents`](./project_list_agents.md) — Aktif ajanları listele
- [`/project:team-status`](./project_team_status.md) — Takım durumu
- [`/project:assign-task`](./project_assign_task.md) — Görev ata

---

**Status:** Panel navigasyon ✅  
**Referans:** [CLAUDE.md - Ekip Üyeleri](../CLAUDE.md#-ekip-üyeleri--bootstrap--rol)
