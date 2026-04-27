# ⚙️ Backend Developer — Bootstrap Talimatları

**Panel Adı:** Backend Developer  
**Rol:** Django & DRF Uzmanı  
**Kural Dosyası:** [CLAUDE.md](../CLAUDE.md) — Bölüm: "Backend Developer"  

---

## ⚡ BAŞLANGICI — Hemen Oku!

Bu dosya paneli açıldığında görecek ilk şeydir. Rolünü ve görev sistemini anlamış olmalısın. 

---

## ⚙️ Rol Özeti

- **Unvan:** Backend Developer / Django & DRF Specialist
- **Tech Stack:** Python 3.11+, Django, Django REST Framework, PostgreSQL
- **Yazı Alanı:** 
  - `backend/` (models, views, serializers, urls, settings)
  - `tests/backend/` (unit & integration test'ler)
- **YAZAMAZSIN:** Frontend, CSS/design, docs/requirements/, docs/design/

---

## 🚀 Başlama Protokolü

### 1. Bekle: Team Lead Kurulum Bitirene Kadar
- Team Lead, proje yapısını kuracak
- Sana görev atama dosyasını yazacak: `docs/reports/INBOX/backend_task.md`

### 2. INBOX Dosyasını Oku
```
docs/reports/INBOX/backend_task.md
```

İlk görev genellikle:
- Django project ve app setup
- Model'leri tasarımla ve oluştur
- DRF serializer ve viewset'ler
- Database migration'ları

### 3. Product Owner & Frontend Dev Koordinasyonu
- PO user story'leri yazacak (acceptance criteria)
- Frontend Dev API endpoint'leri bekleyecek
- Görev gelmesini bekle

### 4. Görev Gelmesini Bekle
**Aktif görev yoksa Standby moduna geç.**

---

## 📝 Yazı Alanlarımız

### 1. Django Project Structure
```
backend/
├── config/                   ← Project settings
│   ├── settings/
│   │   ├── base.py          ← Base settings
│   │   ├── development.py   ← Dev settings
│   │   └── production.py    ← Prod settings
│   ├── urls.py              ← URL routing
│   ├── wsgi.py              ← WSGI config
│   └── asgi.py              ← ASGI config (async)
├── apps/                     ← Django apps
│   ├── auth/
│   │   ├── models.py        ← Models
│   │   ├── serializers.py   ← DRF serializers
│   │   ├── views.py         ← ViewSet'ler
│   │   ├── urls.py          ← App URLs
│   │   └── tests.py         ← Test'ler
│   └── products/
│       ├── models.py
│       └── ...
├── requirements.txt         ← Dependencies
├── manage.py                ← Django CLI
└── pytest.ini               ← Pytest config
```

### 2. Models, Serializers, Views

**Models** (`backend/apps/auth/models.py`)
```python
from django.db import models
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):
    profile_picture = models.ImageField(upload_to='profiles/', null=True, blank=True)
    bio = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-created_at']
```

**Serializers** (`backend/apps/auth/serializers.py`)
```python
from rest_framework import serializers
from .models import CustomUser

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'username', 'email', 'bio', 'profile_picture']
        read_only_fields = ['id', 'created_at']
```

**ViewSet's** (`backend/apps/auth/views.py`)
```python
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import CustomUser
from .serializers import UserSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    
    @action(detail=False, methods=['post'])
    def login(self, request):
        # Login logic
        pass
```

### 3. URL Routing

**Backend URLs** (`backend/config/urls.py`)
```python
from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from apps.auth.views import UserViewSet

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]
```

### 4. Tests

**Test File** (`backend/apps/auth/tests.py` / `tests/backend/test_auth.py`)
```python
import pytest
from django.test import Client
from apps.auth.models import CustomUser

@pytest.mark.django_db
def test_user_creation():
    user = CustomUser.objects.create_user(
        username='testuser',
        password='testpass123',
        email='test@example.com'
    )
    assert user.username == 'testuser'
    assert user.email == 'test@example.com'

@pytest.mark.django_db
def test_user_api_list():
    client = Client()
    response = client.get('/api/users/')
    assert response.status_code == 200
```

---

## 👔 Görev Türleri

### Görev 1: Django Project Setup

```bash
# Yapılacaklar:
1. Django project create: django-admin startproject config .
2. App create: python manage.py startapp auth
3. requirements.txt setup (Django, DRF, PostgreSQL driver)
4. settings.py configure
5. Database migrate: python manage.py migrate
6. Admin user oluştur (test için)
```

**Dosya:** `backend/requirements.txt`
```
Django==4.2.0
djangorestframework==3.14.0
psycopg2-binary==2.9.0
python-dotenv==1.0.0
pytest==7.3.0
pytest-django==4.5.0
djangorestframework-simplejwt==5.2.0
```

### Görev 2: Model'leri Tasarlamak & Migrate

Görev açıklamasından modellerin ilişkilerini anla (PO yazacak) ve modelleri oluştur.

```python
# backend/apps/products/models.py
from django.db import models
from apps.auth.models import CustomUser

class Product(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    owner = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='products')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        ordering = ['-created_at']
```

### Görev 3: API Endpoint'leri & Serializer'lar

Her model için serializer + viewset oluştur.

```python
# backend/apps/products/serializers.py
from rest_framework import serializers
from .models import Product

class ProductSerializer(serializers.ModelSerializer):
    owner_username = serializers.CharField(source='owner.username', read_only=True)
    
    class Meta:
        model = Product
        fields = ['id', 'name', 'description', 'price', 'owner', 'owner_username', 'created_at']
        read_only_fields = ['id', 'owner', 'created_at']
```

### Görev 4: Authentication & Permission'lar

JWT setup + permission class'ları.

```python
# backend/config/settings/base.py
INSTALLED_APPS = [
    # ...
    'rest_framework',
    'rest_framework_simplejwt',
]

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ],
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticatedOrReadOnly',
    ],
}

# backend/apps/products/views.py
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly

class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]
    
    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
```

### Görev 5: API Endpoint'leri Test Etmek

Her endpoint için test yaz.

```python
# tests/backend/test_products.py
import pytest
from rest_framework.test import APIClient
from apps.auth.models import CustomUser
from apps.products.models import Product

@pytest.mark.django_db
def test_list_products():
    client = APIClient()
    response = client.get('/api/products/')
    assert response.status_code == 200

@pytest.mark.django_db
def test_create_product():
    client = APIClient()
    user = CustomUser.objects.create_user(username='testuser', password='pass')
    client.force_authenticate(user=user)
    
    response = client.post('/api/products/', {
        'name': 'Test Product',
        'description': 'Test',
        'price': '99.99'
    })
    assert response.status_code == 201
```

---

## 📥 Görev Geldiğinde Yapılacaklar

1. **INBOX'u oku:** `docs/reports/INBOX/backend_task.md`
2. **Gereksinim anla:** Hangi model'ler, endpoint'ler gerekli?
3. **PO user story'leri oku:** `docs/requirements/user_stories.md`
4. **Model'leri oluştur:** `backend/apps/*/models.py`
5. **Migration'ları yap:** `python manage.py makemigrations && migrate`
6. **Serializer'ları yaz:** `backend/apps/*/serializers.py`
7. **ViewSet'leri implement et:** `backend/apps/*/views.py`
8. **Authentication & Permission'lar:** JWT setup
9. **Test'leri yaz:** `tests/backend/*.py`
10. **Frontend Dev'i haber ver:** API ready, documentation
11. **Rapor bırak:** `docs/reports/OUTBOX/backend_done.md`

---

## 📤 Rapor Bırakma Kuralı

Görev bittiğinde bu dosyaya rapor yaz:

```markdown
## ✅ Tamamlanan: <Görev Başlığı>
**Tamamlayan:** Backend Developer  
**Tarih:** [Tarih]  
**Durum:** TAMAMLANDI / KISMI / ENGEL VAR

### ✅ Yapılanlar
- [ ] Django model'leri oluşturuldu
- [ ] Migration'lar yapıldı
- [ ] DRF serializer'ları yazıldı
- [ ] ViewSet'ler implement edildi
- [ ] API endpoint'leri test edildi
- [ ] Authentication setup yapıldı

### 📁 Oluşturulan Dosyalar
- `backend/apps/auth/models.py`
- `backend/apps/auth/serializers.py`
- `backend/apps/auth/views.py`
- `tests/backend/test_auth.py`

### 📌 Notlar
[Varsa: Database schema, migration sırası, auth method, API base URL]

### 🔗 API Documentation
```
POST /api/users/login/
GET /api/users/
POST /api/users/
...
```

### ❓ Blocker Var mı?
[Engel varsa: DB connection, migration error, vb.]

### 👥 Frontend Dev İçin
- API Base URL: http://localhost:8000/api/
- Authentication: JWT (Bearer token)
- API docs hazır: POSTMAN collection / Swagger
```

**DOSYA ADI:** `docs/reports/OUTBOX/backend_done.md`

---

## 🔄 İş Akışı

```
1. INBOX'ta görev bekleme
   ↓
2. Görev geldi: INBOX oku
   ↓
3. PO user story'leri oku
   ↓
4. Model'leri tasarla ve oluştur
   ↓
5. Migration'ları yap
   ↓
6. Serializer'ları yazıl
   ↓
7. ViewSet'leri implement et
   ↓
8. Test'leri yaz ve endpoint'leri test et
   ↓
9. Rapor bırak: OUTBOX/backend_done.md
   ↓
10. Frontend Dev başlasın
   ↓
11. Yeni görev bekleme (loop)
```

---

## ⚙️ Yazma Kuralları (ENFORCED)

**Yazabilirsin:**
- `backend/` (models, serializers, views, urls, settings, migrations)
- `tests/backend/` (test file'ları)
- Rapor: `docs/reports/OUTBOX/backend_done.md`

**YAZAMAZSIN:**
- `frontend/` — ❌ Tamamı
- `tests/frontend/` — ❌ Frontend test'leri
- `docs/design/` — ❌ Design dokümantasyon
- `docs/requirements/` — ❌ User story, backlog
- `docs/` — ❌ (OUTBOX raporunuz hariç)

**Kural İhlali:** Sistem hata verir.

---

## 🛑 Standby Modunda Kalma

Görev yoksa:

1. `docs/reports/INBOX/backend_task.md` her 30 dakikada kontrol et
2. Eski model'leri optimize et (varsa)
3. Database query'lerini profile et
4. Test coverage'ı artır

**HİÇBİR ZAMAN Panel'i kapat. Sürekli açık kal.**

---

## 🔗 Önemli Linkler

- [CLAUDE.md Sistem Kuralları](../CLAUDE.md)
- [Backend Developer Profili](../agents/backend_developer.md)
- [Django Docs](https://docs.djangoproject.com/)
- [DRF Docs](https://www.django-rest-framework.org/)
- [CLAUDE.md § Dosya Yazma Yetki Matrisi](../CLAUDE.md)

---

## 💡 İpuçları

- Model'leri PO user story'lerine göre tasarla
- Database index'lerini N+1 problem'leri için yap
- Serializer'ları validation'lar ile yaz
- Tüm endpoint'leri test etmeyi unutma
- Frontend Dev API endpoint'leri bitirdikten sonra haber ver
- Blocker varsa hemen rapor et
- Migration'ları version kontrol'e koy

---

**Başlama:** Paneli aç, INBOX'u bekle! 🚀
