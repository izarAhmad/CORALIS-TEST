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

# 📁 Project Structure


coralis-test
│
├── coralis_auth_app
│ ├── android
│ ├── assets
│ │ └── images
│ ├── build
│ ├── ios
│ ├── lib
│ │ ├── screens
│ │ │ ├── forgot_password_screen.dart
│ │ │ ├── home_screen.dart
│ │ │ ├── landing_screen.dart
│ │ │ ├── login_screen.dart
│ │ │ ├── register_screen.dart
│ │ │ └── reset_password_screen.dart
│ │ │
│ │ ├── services
│ │ │ └── api_service.dart
│ │ │
│ │ └── main.dart
│ │
│ ├── linux
│ ├── macos
│ ├── test
│ ├── web
│ ├── windows
│ ├── .gitignore
│ ├── analysis_options.yaml
│ ├── pubspec.yaml
│ └── README.md
│
└── coralis-auth-backend
├── config
│ └── db.js
│
├── controllers
│ └── authController.js
│
├── models
│ └── userModel.js
│
├── routes
│ └── authRoutes.js
│
├── utils
│ └── emailService.js
│
├── node_modules
├── .env
├── package.json
└── app.js



---

# 🗄 DATABASE SETUP

Jalankan SQL berikut di MySQL:

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


BACKEND SETUP (Node.js |Express Js)
1. Masuk ke folder backend
cd coralis-auth-backend

2. Install dependency
npm install

3. Buat file .env

Isi sesuai konfigurasi:

DB_HOST=localhost
DB_USER=root
DB_PASS=
DB_NAME=coralis_auth

JWT_SECRET=supersecretkey
EMAIL_USER=youremail@gmail.com
EMAIL_PASS=yourpassword

4. Jalankan backend
node app.js


Server berjalan di:

port 3000

FLUTTER SETUP
1. Masuk ke folder Flutter
cd coralis_auth_app

2. Install package
flutter pub get

3. Jalankan aplikasi

Debug:

flutter run


Release:

flutter run --release


Aplikasi dijalankan pada Android Emulator.

| Method | Endpoint             | Function            |
| ------ | -------------------- | ------------------- |
| POST   | /api/register        | Register user       |
| POST   | /api/login           | Login               |
| POST   | /api/forgot-password | Send reset token    |
| POST   | /api/reset-password  | Update new password |

