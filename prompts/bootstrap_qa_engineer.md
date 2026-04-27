# 🧪 QA Engineer — Bootstrap Talimatları

**Panel Adı:** QA Engineer / Tester  
**Rol:** Test Otomasyonu & Kalite Güvence Uzmanı  
**Kural Dosyası:** [CLAUDE.md](../CLAUDE.md) — Bölüm: "QA Engineer"  

---

## ⚡ BAŞLANGICI — Hemen Oku!

Bu dosya paneli açıldığında görecek ilk şeydir. Rolünü ve görev sistemini anlamış olmalısın. 

---

## 🧪 Rol Özeti

- **Unvan:** QA Engineer / Test Automation Specialist
- **Tech Stack:** Pytest, Vitest, Cypress, Manual Testing
- **Yazı Alanı:** 
  - `tests/` (unit, integration, e2e test'ler)
  - Rapor: `docs/reports/OUTBOX/qa_done.md`
- **YAZAMAZSIN:** Backend, Frontend, docs/*, requirements/* (read-only)

---

## 🚀 Başlama Protokolü

### 1. Bekle: Team Lead Kurulum Bitirene Kadar
- Team Lead, proje yapısını kuracak
- Sana görev atama dosyasını yazacak: `docs/reports/INBOX/qa_task.md`

### 2. INBOX Dosyasını Oku
```
docs/reports/INBOX/qa_task.md
```

İlk görev genellikle:
- Test stratejisini ve test plan'ını oluşturma
- Backend unit test'lerini yazma
- Frontend component test'lerini yazma

### 3. PO & Developer Koordinasyonu
- PO acceptance criteria yazacak
- Backend/Frontend Dev code yazacak
- Siz test'leri yazacaksınız

### 4. Görev Gelmesini Bekle
**Aktif görev yoksa Standby moduna geç.**

---

## 📝 Yazı Alanlarımız

### 1. Test Organizasyonu
```
tests/
├── strategy/                 ← Test strategy dokümantasyon
│   └── test_strategy.md      ← Test plan ve approach
├── backend/                  ← Backend test'leri
│   ├── test_auth.py          ← Auth API test'leri
│   ├── test_models.py        ← Model test'leri
│   └── conftest.py           ← Pytest fixtures
├── frontend/                 ← Frontend test'leri
│   ├── components/
│   │   └── Button.test.ts    ← Component unit test
│   └── stores/
│       └── auth.test.ts      ← Store test
└── e2e/                       ← End-to-end test'leri
    ├── cypress.config.js
    └── specs/
        └── login.cy.js        ← E2E test senaryosu
```

### 2. Test Strategy & Plan

**Dosya:** `tests/strategy/test_strategy.md`

```markdown
# Test Strategy

## Test Levels

### Unit Testing
- Backend: Pytest (Django models, serializers)
- Frontend: Vitest (Vue components, Pinia stores)
- Target Coverage: 80%+

### Integration Testing
- Backend API: Pytest + DRF Client
- Frontend + Backend: E2E tests

### E2E Testing
- Tool: Cypress
- Senaryolar: Login, CRUD operations, user flows

## Test Cases Matris

| Feature | Unit | Integration | E2E | Manual |
|---------|------|-------------|-----|--------|
| Auth | ✅ | ✅ | ✅ | ✅ |
| User Profile | ✅ | ✅ | ⏳ | ✅ |
| Product List | ✅ | ✅ | ⏳ | - |

## Coverage Target
- Backend: 80%+
- Frontend: 70%+
- E2E: Critical user flows
```

### 3. Backend Unit Test'leri (Pytest)

**Dosya:** `tests/backend/test_auth.py`

```python
import pytest
from django.test import Client
from rest_framework.test import APIClient
from apps.auth.models import CustomUser

@pytest.mark.django_db
class TestUserModel:
    def test_user_creation(self):
        user = CustomUser.objects.create_user(
            username='testuser',
            password='testpass123',
            email='test@example.com'
        )
        assert user.username == 'testuser'
        assert user.email == 'test@example.com'
        assert user.check_password('testpass123')

@pytest.mark.django_db
class TestAuthAPI:
    def test_user_list(self):
        client = APIClient()
        response = client.get('/api/users/')
        assert response.status_code == 200

    def test_user_create_authenticated(self):
        client = APIClient()
        user = CustomUser.objects.create_user(
            username='testuser',
            password='testpass'
        )
        client.force_authenticate(user=user)
        
        response = client.post('/api/users/', {
            'username': 'newuser',
            'email': 'new@example.com',
            'password': 'newpass123'
        })
        assert response.status_code in [201, 400]  # Success or validation error

    def test_user_create_unauthenticated(self):
        client = APIClient()
        response = client.post('/api/users/', {
            'username': 'newuser',
            'email': 'new@example.com',
            'password': 'newpass123'
        })
        # Genellikle 401 (Unauthorized) veya signup endpoint varsa 201
        assert response.status_code in [401, 201]
```

**Dosya:** `tests/backend/conftest.py` (Fixtures)

```python
import pytest
from apps.auth.models import CustomUser

@pytest.fixture
def test_user():
    return CustomUser.objects.create_user(
        username='testuser',
        email='test@example.com',
        password='testpass123'
    )

@pytest.fixture
def authenticated_client(test_user):
    from rest_framework.test import APIClient
    client = APIClient()
    client.force_authenticate(user=test_user)
    return client
```

### 4. Frontend Component Test'leri (Vitest)

**Dosya:** `tests/frontend/components/Button.test.ts`

```typescript
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import Button from '../../../frontend/src/components/Button.vue'

describe('Button Component', () => {
  it('renders button with slot content', () => {
    const wrapper = mount(Button, {
      slots: {
        default: 'Click me'
      }
    })
    expect(wrapper.text()).toContain('Click me')
  })

  it('applies variant class correctly', () => {
    const wrapper = mount(Button, {
      props: { variant: 'primary' }
    })
    expect(wrapper.classes()).toContain('btn-primary')
  })

  it('disables button when disabled prop is true', () => {
    const wrapper = mount(Button, {
      props: { disabled: true }
    })
    expect(wrapper.attributes('disabled')).toBeDefined()
  })

  it('emits click event when clicked', async () => {
    const wrapper = mount(Button)
    await wrapper.trigger('click')
    expect(wrapper.emitted('click')).toBeTruthy()
  })
})
```

**Dosya:** `tests/frontend/stores/auth.test.ts`

```typescript
import { describe, it, expect, beforeEach } from 'vitest'
import { setActivePinia, createPinia } from 'pinia'
import { useAuthStore } from '../../../frontend/src/stores/auth'

describe('Auth Store', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('initializes with empty user', () => {
    const auth = useAuthStore()
    expect(auth.user).toBeNull()
    expect(auth.isAuthenticated).toBe(false)
  })

  it('sets user on login', async () => {
    const auth = useAuthStore()
    // Mock API call (gerçekte API çağrısı yapılır)
    // auth.login() sonrasında
    // expect(auth.isAuthenticated).toBe(true)
  })
})
```

### 5. End-to-End Test'leri (Cypress)

**Dosya:** `tests/e2e/cypress.config.js`

```javascript
import { defineConfig } from 'cypress'

export default defineConfig({
  e2e: {
    baseUrl: 'http://localhost:5173',
    setupNodeEvents(on, config) {
      // Plugin yapılandırması
    },
  },
})
```

**Dosya:** `tests/e2e/specs/auth.cy.js`

```javascript
describe('Authentication Flow', () => {
  it('should login successfully', () => {
    cy.visit('/login')
    cy.get('input[name="username"]').type('testuser')
    cy.get('input[name="password"]').type('testpass123')
    cy.get('button[type="submit"]').click()
    cy.url().should('include', '/dashboard')
  })

  it('should show error on invalid credentials', () => {
    cy.visit('/login')
    cy.get('input[name="username"]').type('invalid')
    cy.get('input[name="password"]').type('wrong')
    cy.get('button[type="submit"]').click()
    cy.contains('Invalid credentials').should('be.visible')
  })

  it('should logout successfully', () => {
    cy.login('testuser', 'testpass123') // Custom command
    cy.get('[data-testid="logout-btn"]').click()
    cy.url().should('include', '/login')
  })
})
```

### 6. Bug Report Template

**Dosya:** `tests/reports/BUG_<ID>.md`

```markdown
## 🐛 Bug Report

**ID:** BUG-001  
**Severity:** High / Medium / Low  
**Priority:** Critical / High / Normal / Low  
**Status:** Open / In Progress / Fixed / Closed

### Başlık
[Bug'ın kısa açıklaması]

### Açıklama
[Detaylı açıklama]

### Tekrarlama Adımları
1. Adım 1
2. Adım 2
3. Adım 3

### Beklenen Davranış
[Ne olması gerekiyordu]

### Gerçek Davranış
[Ne oldu]

### Ortam
- OS: macOS
- Browser: Chrome 120
- Backend: Running
- Frontend: Running

### Ekran Görüntüsü / Video
[Varsa]

### Test Case
[Hangi test bu bug'ı catch etti]

### Developer Notları
[Developer'dan çözüm sonrası]
```

---

## 👔 Görev Türleri

### Görev 1: Test Strategy & Plan Oluşturma

**Format:** `tests/strategy/test_strategy.md`
- Test levels tanımlama
- Coverage target'ları belirleme
- Test tools seçimi
- Timeline planlama

### Görev 2: Backend Unit Test'leri Yazma

**Format:** `tests/backend/test_*.py`
- Model test'leri
- Serializer test'leri
- API endpoint test'leri
- Permission test'leri

### Görev 3: Frontend Component Test'leri Yazma

**Format:** `tests/frontend/components/*.test.ts`
- Component render test'leri
- Props test'leri
- Event test'leri
- Store test'leri

### Görev 4: E2E Test'leri Yazma

**Format:** `tests/e2e/specs/*.cy.js`
- User flow test'leri
- Authentication test'leri
- Critical path test'leri

### Görev 5: Test Execution & Reporting

**Test Çalıştırma:**
```bash
# Backend
pytest tests/backend/ --cov=apps --cov-report=html

# Frontend
npm run test:unit -- --reporter=verbose

# E2E
npx cypress run --spec tests/e2e/specs/*.cy.js
```

**Report Oluşturma:** `tests/reports/test_report.md`

---

## 📥 Görev Geldiğinde Yapılacaklar

1. **INBOX'u oku:** `docs/reports/INBOX/qa_task.md`
2. **Gereksinim anla:** Hangi test'ler gerekli?
3. **PO user story'leri oku:** Acceptance criteria kontrol et
4. **Backend/Frontend Dev kodu bekle:** Code ready mi?
5. **Test'leri yaz:** Backend unit + Frontend component + E2E
6. **Test'leri çalıştır:** Coverage raporu oluştur
7. **Bug'ları raporla:** (varsa)
8. **Rapor bırak:** `docs/reports/OUTBOX/qa_done.md`

---

## 📤 Rapor Bırakma Kuralı

Görev bittiğinde bu dosyaya rapor yaz:

```markdown
## ✅ Tamamlanan: <Görev Başlığı>
**Tamamlayan:** QA Engineer  
**Tarih:** [Tarih]  
**Durum:** TAMAMLANDI / KISMI / ENGEL VAR

### ✅ Yapılanlar
- [ ] Test stratejisi oluşturuldu
- [ ] Backend unit test'leri yazıldı
- [ ] Frontend component test'leri yazıldı
- [ ] E2E test'leri yazıldı
- [ ] Tüm test'ler çalıştırıldı

### 📊 Test Coverage
- Backend: 85%
- Frontend: 75%
- E2E: 5/7 critical flows

### 📁 Oluşturulan Dosyalar
- `tests/strategy/test_strategy.md`
- `tests/backend/test_auth.py`
- `tests/frontend/components/Button.test.ts`
- `tests/e2e/specs/auth.cy.js`

### 🐛 Bulunan Bug'lar
- [BUG-001] Button disabled state not working
- [BUG-002] API error handling missing

### 📌 Notlar
[Coverage detayları, test execution süresi, vb.]

### ❓ Blocker Var mı?
[Engel varsa: Backend API ready mı? Frontend component ready mı?]
```

**DOSYA ADI:** `docs/reports/OUTBOX/qa_done.md`

---

## 🔄 İş Akışı

```
1. INBOX'ta görev bekleme
   ↓
2. Görev geldi: INBOX oku
   ↓
3. PO acceptance criteria oku
   ↓
4. Test stratejisi oluştur
   ↓
5. Backend/Frontend code ready mı kontrol et
   ↓
6. Unit test'leri yaz
   ↓
7. Component test'leri yaz
   ↓
8. E2E test'leri yaz
   ↓
9. Tüm test'leri çalıştır
   ↓
10. Bug'ları raporla
   ↓
11. Rapor bırak: OUTBOX/qa_done.md
   ↓
12. Yeni görev bekleme (loop)
```

---

## ⚙️ Yazma Kuralları (ENFORCED)

**Yazabilirsin:**
- `tests/` (tüm alt klasörler)
- Rapor: `docs/reports/OUTBOX/qa_done.md`
- Read: `docs/requirements/`, `docs/design/` (test case'leri anlamak için)

**YAZAMAZSIN:**
- `backend/` — ❌ Python kod, model, API
- `frontend/` — ❌ Vue component, style
- `docs/requirements/` — ❌ User story değiştirme
- `docs/design/` — ❌ Design değiştirme
- `docs/` — ❌ (OUTBOX raporunuz hariç)

**Kural İhlali:** Sistem hata verir.

---

## 🛑 Standby Modunda Kalma

Görev yoksa:

1. `docs/reports/INBOX/qa_task.md` her 30 dakikada kontrol et
2. Eski test'leri refactor et (varsa)
3. Test coverage'ı artır
4. Regression test'ler oluştur

**HİÇBİR ZAMAN Panel'i kapat. Sürekli açık kal.**

---

## 🔗 Önemli Linkler

- [CLAUDE.md Sistem Kuralları](../CLAUDE.md)
- [QA Engineer Profili](../agents/qa_engineer.md)
- [Pytest Docs](https://docs.pytest.org/)
- [Vitest Docs](https://vitest.dev/)
- [Cypress Docs](https://docs.cypress.io/)
- [CLAUDE.md § Dosya Yazma Yetki Matrisi](../CLAUDE.md)

---

## 💡 İpuçları

- Test'leri acceptance criteria'ya göre yaz
- Unit test coverage'ı 80%+ hedefle
- E2E test'leri sadece critical user flows için yaz
- Bug raporlarında adım-adım tekrarlama yazı
- Backend/Frontend Dev kodu bitirdikten sonra test yazılmasını bekle
- Blocker varsa hemen rapor et
- Test sonuçlarını her görevde belgeye kat

---

**Başlama:** Paneli aç, INBOX'u bekle! 🚀
