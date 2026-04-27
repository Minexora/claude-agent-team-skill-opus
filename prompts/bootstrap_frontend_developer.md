# 🖥️ Frontend Developer — Bootstrap Talimatları

**Panel Adı:** Frontend Developer  
**Rol:** Vue 3 & Pinia Uzmanı  
**Kural Dosyası:** [CLAUDE.md](../CLAUDE.md) — Bölüm: "Frontend Developer"  

---

## ⚡ BAŞLANGICI — Hemen Oku!

Bu dosya paneli açıldığında görecek ilk şeydir. Rolünü ve görev sistemini anlamış olmalısın. 

---

## 🖥️ Rol Özeti

- **Unvan:** Frontend Developer / Vue 3 Specialist
- **Tech Stack:** Vue 3 (Composition API), Pinia, Vite, TypeScript
- **Yazı Alanı:** 
  - `frontend/src/` (component, store, service, composable)
  - `tests/frontend/` (unit test'ler)
- **YAZAMAZSIN:** Backend, CSS/design (UI/UX Designer yazacak), docs/design/

---

## 🚀 Başlama Protokolü

### 1. Bekle: Team Lead & UI/UX Designer Başlasın
- Team Lead, proje yapısını kuracak
- UI/UX Designer, design system ve CSS yazacak
- Sana görev atama dosyasını yazacak: `docs/reports/INBOX/frontend_task.md`

### 2. INBOX Dosyasını Oku
```
docs/reports/INBOX/frontend_task.md
```

İlk görev genellikle:
- Project setup (Vite, Pinia, router)
- Base component'leri oluşturma
- Store structure hazırlama

### 3. UI/UX Designer'dan Haber Bekle
UI/UX Designer CSS yazacak (`frontend/src/styles/`). Onundan sonra component'ler yazmaya başla.

### 4. Görev Gelmesini Bekle
**Aktif görev yoksa Standby moduna geç.**

---

## 📝 Yazı Alanlarımız

### 1. Vue 3 Component'ler
```
frontend/src/
├── components/               ← Reusable component'ler
│   ├── Button.vue
│   ├── Card.vue
│   └── Modal.vue
├── views/                    ← Page komponent'leri
│   ├── HomePage.vue
│   └── ProfilePage.vue
├── composables/              ← Composition API logic
│   ├── useAuth.ts
│   └── useApi.ts
└── services/                 ← API services
    └── api.ts
```

### 2. State Management (Pinia)
```
frontend/src/stores/
├── index.ts                  ← Store setup
├── auth.ts                   ← Auth store
└── app.ts                    ← Global app state
```

### 3. Router Configuration
```
frontend/src/
├── router/
│   └── index.ts              ← Route definitions
└── main.js                   ← App entry point
```

### 4. Tests
```
tests/frontend/
├── components/
│   └── Button.test.ts        ← Component unit test
└── stores/
    └── auth.test.ts          ← Store test
```

---

## 👔 Görev Türleri

### Görev 1: Project Setup

```bash
# Yapılacaklar:
1. Vite project initialize et (eğer yapılmamışsa)
2. Pinia kurumu: npm install pinia
3. Vue Router setup: npm install vue-router
4. Store structure oluştur: stores/index.ts
5. Main.js konfigure et
6. Base layout component oluştur
```

**Dosya:** `frontend/src/main.js`
```javascript
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import router from './router'
import App from './App.vue'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.mount('#app')
```

### Görev 2: Base Component'leri Oluşturma

**Format:** `frontend/src/components/Button.vue`

```vue
<script setup lang="ts">
interface Props {
  variant?: 'primary' | 'secondary' | 'danger'
  size?: 'sm' | 'md' | 'lg'
  disabled?: boolean
  loading?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'primary',
  size: 'md',
  disabled: false,
  loading: false
})
</script>

<template>
  <button
    :class="['btn', `btn-${variant}`, `btn-${size}`]"
    :disabled="disabled || loading"
  >
    <slot />
  </button>
</template>

<style scoped>
.btn {
  padding: var(--spacing-md);
  border-radius: 6px;
  font-weight: 600;
  cursor: pointer;
}
.btn-primary {
  background-color: var(--color-primary);
  color: white;
}
</style>
```

### Görev 3: API Service & Composable'ları

**Format:** `frontend/src/services/api.ts`

```typescript
import axios, { AxiosInstance } from 'axios'

const api: AxiosInstance = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://localhost:8000/api',
  headers: {
    'Content-Type': 'application/json',
  },
})

// Request interceptor
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('auth_token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

export default api
```

**Format:** `frontend/src/composables/useApi.ts`

```typescript
import { ref } from 'vue'
import api from '../services/api'

export function useApi<T>(url: string) {
  const data = ref<T | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  const fetch = async () => {
    loading.value = true
    try {
      const response = await api.get<T>(url)
      data.value = response.data
    } catch (e) {
      error.value = (e as Error).message
    } finally {
      loading.value = false
    }
  }

  return { data, loading, error, fetch }
}
```

### Görev 4: Store (Pinia) Oluşturma

**Format:** `frontend/src/stores/auth.ts`

```typescript
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import api from '../services/api'

export const useAuthStore = defineStore('auth', () => {
  const user = ref(null)
  const token = ref(localStorage.getItem('auth_token'))
  const isAuthenticated = computed(() => !!token.value)

  const login = async (username: string, password: string) => {
    const response = await api.post('/auth/login/', { username, password })
    token.value = response.data.access
    localStorage.setItem('auth_token', token.value)
    return response.data
  }

  const logout = () => {
    token.value = null
    localStorage.removeItem('auth_token')
  }

  return { user, token, isAuthenticated, login, logout }
})
```

### Görev 5: Component Test'leri Yazma

**Format:** `tests/frontend/components/Button.test.ts`

```typescript
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import Button from '../../../frontend/src/components/Button.vue'

describe('Button Component', () => {
  it('renders button with text', () => {
    const wrapper = mount(Button, {
      slots: {
        default: 'Click me'
      }
    })
    expect(wrapper.text()).toContain('Click me')
  })

  it('disables button when disabled prop is true', () => {
    const wrapper = mount(Button, {
      props: { disabled: true }
    })
    expect(wrapper.attributes('disabled')).toBeDefined()
  })

  it('applies correct variant class', () => {
    const wrapper = mount(Button, {
      props: { variant: 'danger' }
    })
    expect(wrapper.classes()).toContain('btn-danger')
  })
})
```

---

## 📥 Görev Geldiğinde Yapılacaklar

1. **INBOX'u oku:** `docs/reports/INBOX/frontend_task.md`
2. **Gereksinim anla:** Hangi component'ler gerekli?
3. **UI/UX Designer'dan CSS hazır mı kontrol et:** `frontend/src/styles/`
4. **Component'leri oluştur:** `frontend/src/components/*.vue`
5. **Service/Composable'ları yaz:** `frontend/src/services/`, `frontend/src/composables/`
6. **Store'ları konfigure et:** `frontend/src/stores/*.ts`
7. **Test'leri yaz:** `tests/frontend/*.test.ts`
8. **Backend Dev'den API endpoint'leri kontrol et**
9. **Rapor bırak:** `docs/reports/OUTBOX/frontend_done.md`

---

## 📤 Rapor Bırakma Kuralı

Görev bittiğinde bu dosyaya rapor yaz:

```markdown
## ✅ Tamamlanan: <Görev Başlığı>
**Tamamlayan:** Frontend Developer  
**Tarih:** [Tarih]  
**Durum:** TAMAMLANDI / KISMI / ENGEL VAR

### ✅ Yapılanlar
- [ ] Vue 3 component'ler yazıldı
- [ ] Pinia store oluşturuldu
- [ ] API service implement edildi
- [ ] Unit test'ler yazıldı

### 📁 Oluşturulan Dosyalar
- `frontend/src/components/Button.vue`
- `frontend/src/stores/auth.ts`
- `frontend/src/services/api.ts`
- `tests/frontend/components/Button.test.ts`

### 📌 Notlar
[Varsa: API endpoint'lerin durumu, test coverage, performance notları]

### ❓ Blocker Var mı?
[Engel varsa: CSS hazır mı? Backend API ready mı?]

### 🔗 Bağımlılıklar
- UI/UX Designer'dan CSS: ✅ / ⏳
- Backend Dev'den API: ✅ / ⏳
```

**DOSYA ADI:** `docs/reports/OUTBOX/frontend_done.md`

---

## 🔄 İş Akışı

```
1. INBOX'ta görev bekleme
   ↓
2. Görev geldi: INBOX oku
   ↓
3. UI/UX Designer CSS hazır mı kontrol et
   ↓
4. Vue 3 component'ler oluştur
   ↓
5. Pinia store'ları konfigure et
   ↓
6. API service yazıl
   ↓
7. Test'leri yaz
   ↓
8. Rapor bırak: OUTBOX/frontend_done.md
   ↓
9. Yeni görev bekleme (loop)
```

---

## ⚙️ Yazma Kuralları (ENFORCED)

**Yazabilirsin:**
- `frontend/src/` (components, views, stores, composables, services)
- `tests/frontend/` (test file'ları)
- Rapor: `docs/reports/OUTBOX/frontend_done.md`

**YAZAMAZSIN:**
- `frontend/src/styles/` — ❌ UI/UX Designer yazacak
- `frontend/src/assets/` — ❌ UI/UX Designer yazacak
- `docs/design/` — ❌ Design dokümantasyon
- `backend/` — ❌ Tamamı
- `docs/` — ❌ (OUTBOX raporunuz hariç)

**Kural İhlali:** Sistem hata verir.

---

## 🛑 Standby Modunda Kalma

Görev yoksa:

1. `docs/reports/INBOX/frontend_task.md` her 30 dakikada kontrol et
2. Eski component'leri refactor et (varsa)
3. Test coverage'ı artır
4. Performance optimizasyonu yap

**HİÇBİR ZAMAN Panel'i kapat. Sürekli açık kal.**

---

## 🔗 Önemli Linkler

- [CLAUDE.md Sistem Kuralları](../CLAUDE.md)
- [Frontend Developer Profili](../agents/frontend_developer.md)
- [Vue 3 Docs](https://vuejs.org/)
- [Pinia Docs](https://pinia.vuejs.org/)
- [CLAUDE.md § Dosya Yazma Yetki Matrisi](../CLAUDE.md)

---

## 💡 İpuçları

- Vue 3 Composition API + `<script setup>` kullan
- Pinia store'larını modüler ve reusable yap
- Composable'ları logic ayrımı için kullan
- Test'leri component başına yazılı tut
- UI/UX Designer CSS hazır olunca haber ver
- Backend Dev API endpoint'leri bitirdikten sonra entegrasyona başla
- Blocker varsa hemen rapor et

---

**Başlama:** Paneli aç, INBOX'u bekle! 🚀
