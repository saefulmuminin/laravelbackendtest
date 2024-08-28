
# Laravel Backend Test

Laravel Backend Test adalah proyek API yang dibangun menggunakan Laravel, bertujuan untuk menyediakan solusi backend yang kuat dan fleksibel untuk aplikasi web. Proyek ini dirancang untuk menguji kemampuan backend dengan menyediakan endpoint API untuk berbagai operasi, termasuk autentikasi, manajemen pengguna, dan manipulasi data.

## Persyaratan

Sebelum memulai, pastikan Anda telah menginstal perangkat lunak berikut:

- **PHP**: Versi 8.0 atau lebih baru
- **Composer**: Alat manajemen dependensi PHP
- **Laravel**: Versi 11 atau lebih baru
- **Laragon atau Exampp**: Untuk local server
- **MySQL**: Database atau database lain yang didukung
- **Postman**: Untuk menguji API (opsional)
## Installation

Ikuti langkah-langkah berikut untuk menginstal dan menjalankan proyek ini:

```bash
git clone https://github.com/saefulmuminin/laravelbackendtest.git
```
```bash
cd laravelbackendtest
```
```bash
composer install
```
```bash
cp .env.example rename .env
```

Buka file .env dan sesuaikan pengaturan database sesuai dengan konfigurasi Anda:
```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=nama_database
DB_USERNAME=nama_pengguna
DB_PASSWORD=kata_sandi
```
```bash
php artisan key:generate
```
```bash
php artisan migrate
```
```bash
php artisan serve
```
## Api Documentasi


Untuk informasi lengkap mengenai cara menggunakan API, silakan import file ApiLaravelBackendTest.postman_collection tautan di bawah ini untuk mengakses dokumentasi API dengan postman


##  Image db diagram

![Logo](https://drive.google.com/file/d/1tzg1AT4ALyIu-8k6R31epTaGAPqGr8Sd/view?usp=sharing)










