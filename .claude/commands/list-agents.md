# /project:list-agents

## Purpose
Mevcut ekip üyelerini listeler ve her birinin sorumlulukları, yazma izinleri ve bootstrap prompt dosyası yolunu sağlar.

---

## Input
- Yok (opsiyonel: `--verbose`)

---

## Behavior
1. Aşağıdaki ajanları listele:
   - Product Owner (PO)
   - Frontend Developer
   - Backend Developer
   - UI/UX Designer
   - QA Engineer
2. Her ajan için kısa özet göster:
   - `role`: Görev adı
   - `write_paths`: Hangi dizinlere yazabilir
   - `bootstrap_prompt`: prompts/bootstrap_*.md dosya yolu

Örnek çıktı satırı:
```
- Frontend Developer: write_paths=frontend/src/, bootstrap_prompt=prompts/bootstrap_frontend_developer.md
```

---

## Output
- Listelenen ajanların metin tabanlı çıktısı
- Eğer `--verbose` verilirse her rolün `agents/*.md` dokümanına link verilir


**Komut:** `/project:list-agents`  
**Durum:** Production  
**Son Güncelleme:** 21 Nisan 2026
