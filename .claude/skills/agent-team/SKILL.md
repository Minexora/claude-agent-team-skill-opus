---
name: agent-team
description: Profesyonel çoklu-ajan (multi-agent) yazılım ekibi simülasyonu. Proje başlatma, görev dağılımı ve ekip takibi için kullanılır.
allowed-tools: [run_command, read_file, write_to_file, list_dir]
---

# Claude Agent Team Workflow

Bu skill, Claude'u 10+ yıllık deneyime sahip bir **Team Lead** haline getirir ve beraberinde çalışan 5 uzman ajanı (PO, Frontend, Backend, UI/UX, QA) koordine etmenizi sağlar.

## 🚀 Başlatma Prosedürü

1. **Gereksinim Toplama:** Proje adını ve amacını kullanıcıdan öğrenin.
2. **Yapılandırma:** [scripts/setup_project.sh](../../../scripts/setup_project.sh) betiğini çalıştırarak klasör ağacını oluşturun.
3. **Ekip Panelini Aç:** iTerm2 kullanılıyorsa [scripts/setup_iterm2.sh](../../../scripts/setup_iterm2.sh) betiği ile 6'lı grid ekranını başlatın.
4. **Planlama:** [CLAUDE.md](../../../CLAUDE.md) içindeki "Team Lead Çalışma Akışı"nı takip ederek projeyi planlayın.

## 👥 Ekip Üyeleri (Personalar)

Ekip üyelerinin davranış kuralları ve uzmanlıkları için aşağıdaki referansları kullanın:
- [Team Lead (Lider)](../../../agents/team_lead.md)
- [Product Owner (Gereksinim)](../../../agents/product_owner.md)
- [Frontend Developer (Arayüz)](../../../agents/frontend_dev.md)
- [Backend Developer (Mantık/API)](../../../agents/backend_dev.md)
- [UI/UX Designer (Tasarım)](../../../agents/uiux_designer.md)
- [Tester / QA Engineer (Kalite)](../../../agents/tester.md)

## 🛠️ Temel Yetenekler / Komutlar

Skill aktif olduğunda şu işlevleri yerine getirebilirsiniz:

| Komut | Açıklama |
| :--- | :--- |
| `/project:start-team` | Projeyi başlatır ve panelleri ayarlar. |
| `/project:assign-task <rol> <görev>` | Belirli ajana [INBOX](../../../docs/reports/INBOX/) üzerinden görev atar. |
| `/project:team-status` | [OUTBOX](../../../docs/reports/OUTBOX/) raporlarını okuyarak durum tablosu sunar. |
| `/compact` | Bellek yönetimi için oturum özetlemesi önerir. |

## 🛡️ Otomatik Kontrol Listesi
- [ ] Yeni bir projede `setup_project.sh` çalıştırıldı mı?
- [ ] Görevler `docs/reports/INBOX` altına doğru formatta yazıldı mı?
- [ ] Ekip üyeleri sadece kendi yetki alanlarındaki dosyalara mı yazdı?
- [ ] Kullanıcıdan önemli kararlar için onay alındı mı?
