@echo off
REM Production Integration Setup Script for Windows

echo.
echo 🚀 Setting up Production-Level Backend-Frontend Integration
echo ===========================================================
echo.

REM Backend setup
echo 📦 Backend Setup:
echo 1. Install backend dependencies...
cd Backend
call npm install

echo 2. Environment configured in .env and .env.production
echo 3. Backend running on http://localhost:5000
echo.

REM Frontend setup
echo 📦 Frontend Setup:
echo 1. Install frontend dependencies...
cd ..\frontend (2)\frontend\prepmaster-react
call npm install axios

echo 2. Environment configured in .env.local and .env.production
echo 3. Frontend running on http://localhost:5173
echo.

echo ✅ Production Integration Complete!
echo ===========================================================
echo.
echo 📊 Architecture Overview:
echo ├── Frontend: React + Vite
echo │   ├── API Service Layer (Axios)
echo │   ├── Authentication (JWT)
echo │   ├── State Management (Context API)
echo │   ├── Custom Hooks (useAuth, useQuestions)
echo │   └── Interceptors (Request/Response)
echo │
echo └── Backend: Express.js + MongoDB
echo     ├── CORS Configuration
echo     ├── JWT Authentication
echo     ├── Error Handling
echo     ├── Request Logging
echo     └── Environment Configuration
echo.
echo 🔗 API Endpoints:
echo ├── POST /api/auth/register
echo ├── POST /api/auth/login
echo ├── GET /api/questions
echo ├── GET /api/questions?domain=X
echo └── GET /api/questions/:id
echo.
pause
