# 🤖 Claude Agent Team Skill

Bu proje, Claude Code ortamında çoklu ajan (multi-agent) yapısıyla çalışmak isteyen profesyonel yazılım geliştirme ekipleri için iTerm2 ekran paylaşımlı özel bir **Claude Code Skill** eklentisidir.

## Genel Bakış
Tek bir Claude CLI örneğini zorlamak yerine, her biri 10 yıllık deneyime sahip, **kendi izole terminalinde koşan** 6 farklı takım üyesi oluşturur.

### 👥 Takım Üyeleri
- **Team Lead (Ana Yönlendirici):** Seninle konuşur, yapıyı kurar, taskları böler.
- **Product Owner:** Gereksinimleri çıkartır, User Story yazar.
- **UI/UX Designer:** Stilleri (CSS/SCSS vb.) ve design guide'ı hazırlar.
- **Frontend Developer:** Vue3 / React / vs. UI komponentlerini ve store yapısını geliştirir.
- **Backend Developer:** Django / Node / Go vb. API ve veritabanı yazar.
- **Tester / QA Engineer:** Uçtan uca (E2E), integration ve unit testleri kurar.

## Kurulum ve Kullanım

Sıfır bir projede veya var olan bir projenizde bu yapıyı kullanmak için:

1. Bu skill'i projenize ekleyin:
   ```bash
   claude skill add https://github.com/Minexora/claude-agent-team-skill-opus.git
   ```
*(Not: GitHub repo adresini kendi reponuza göre düzeltebilirsiniz)*

2. Takımı ayağa kaldırmak ve panelleri açmak için Claude üzerinden komut verin:
   ```bash
   /project:start-team
   ```
*(Veya Claude'a normal konuşarak "Projeyi başlat" diyebilirsiniz.)*

## İletişim Protokolü
Ekip üyeleri birbirleriyle mesajlaşmak yerine **dosya üzerinden (INBOX/OUTBOX)** haberleşir.
- `docs/reports/INBOX/`: Team Lead'in üyelere verdiği görevler.
- `docs/reports/OUTBOX/`: Üyelerin tamamlayıp Team Lead'e teslim ettiği raporlar.
- Her üyenin projenin sadece **belirli alanlarına yazma** yetkisi vardır. (Örn: Backend dev frontend klasörüne yazamaz, ama okuyup API ihtiyacını görür.)

## Komutlar (Team Lead'e komut verin)

Bu skill yüklendiğinde aşağıdaki slash komutlarla kontrol edilebilir:
- `/project:start-team` : Proje yapısını kurar ve 6'lı iTerm2 grid'ini açar.
- `/project:assign-task <rol> <görev>` : Seçilen role hemen INBOX üzerinden görev atar.
- `/project:team-status` : Takımdaki INBOX/OUTBOX dosyalarını okuyup kimin ne yaptığının genel tablosunu çıkarır.
- `/compact` : Token dolmasını engellemek için mevcut oturumu kompakt hale getirir. (Düzenli kullanılması önerilir.)

---
**ÖNEMLİ (İzinler):** Shell script (`scripts/setup_iterm2.sh` vb.) betiğine çalışma izni vermek gerekebilir:
```bash
chmod +x scripts/*.sh
```
