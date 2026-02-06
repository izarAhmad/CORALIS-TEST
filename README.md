Coralis Auth App

Flutter mobile authentication application with Register, Login, and Forgot Password features integrated with Node.js (Express) backend and MySQL database.

This project was developed for the technical assessment of Junior Web Programmer – Coralis Studio.

## Application Preview

<p align="center">
  <img src="/screenshots/landing-page.png" width="30%" />
  <img src="/screenshots/login.png" width="30%" />
  <img src="/screenshots/register.png" width="30%" />
</p>

<p align="center">
  <img src="/screenshots/forgot-password.png" width="30%" />
  <img src="/screenshots/reset-password.png" width="30%" />
  <img src="/screenshots/dashboard.png" width="30%" />
</p>

<p align="center">
  <img src="/screenshots/navbar.png" width="30%" />
</p>


# Coralis Authentication System

Authentication system berbasis **Flutter + Node.js + MySQL** dengan fitur login, register, reset password via email, dan dashboard user.


---

# 🚀 Tech Stack

## 📱 Mobile
- Flutter 3.38.9
- Dart 3.10.8

## 🖥 Backend
- Node.js
- Express.js
- bcrypt
- jsonwebtoken
- dotenv
- cors

## 🗄 Database
- MySQL

---

# ✨ Core Features

### 🔐 Authentication
- Register user
- Login user
- Logout
- JWT token based authentication

### 🔑 Password Recovery
- Forgot password via email
- Email reset token
- Reset password validation

### 📊 User Experience
- Landing page
- Clean login UI
- Dashboard after authentication
- Sidebar navigation
- Persistent login using local token storage

---

---

# ⚙️ Setup & Installation Guide

Ikuti langkah berikut untuk menjalankan project di komputer baru (fresh machine).

---

# 🗄 Database Setup (MySQL)

Jalankan SQL berikut di MySQL / phpMyAdmin:

```sql
CREATE DATABASE coralis_auth;
USE coralis_auth;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  reset_token VARCHAR(255),
  reset_token_expiry DATETIME,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

# 🖥 Backend Setup (Node.js + Express)

### 1. Masuk ke folder backend

```bash
cd coralis-auth-backend
```

### 2. Install dependencies

```bash
npm install
```

### 3. Buat file `.env`

File `.env` berada di dalam folder:

```
coralis-auth-backend/.env
```

Isi dengan konfigurasi berikut:

```
DB_HOST=localhost
DB_USER=root
DB_PASS=
DB_NAME=coralis_auth

JWT_SECRET=supersecretkey
EMAIL_USER=youremail@gmail.com
EMAIL_PASS=yourpassword
```

> Jika file `.env` sudah ada dan konfigurasi sama, tidak perlu membuat ulang.

### 4. Jalankan backend server

```bash
node app.js
```

Server akan berjalan di:

```
http://localhost:3000
```

---

# 📱 Flutter Setup

### 1. Masuk ke folder Flutter

```bash
cd coralis_auth_app
```

### 2. Install package Flutter

```bash
flutter pub get
```

### 3. Jalankan aplikasi

Mode debug:

```bash
flutter run
```

Mode release:

```bash
flutter run --release
```

Aplikasi dijalankan menggunakan **Android Emulator**.

---

# 🔗 API Endpoint

| Method | Endpoint             | Description               |
| ------ | -------------------- | ------------------------- |
| POST   | /api/register        | Register user             |
| POST   | /api/login           | Login user                |
| POST   | /api/forgot-password | Send reset password token |
| POST   | /api/reset-password  | Reset password            |

---



