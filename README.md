# Sistem Akademik — UAS Pemrograman Berorientasi Objek (Dart)

## Nama dan NIM
- Nama: **[ISI NAMA ANDA]**
- NIM: **[ISI NIM ANDA]**

## Tema Aplikasi
Sistem Akademik — pengelolaan data **Mata Kuliah** (Wajib & Pilihan) berbasis CLI.

## Konsep OOP yang Diterapkan
- **Class & Object**: `MataKuliah` (induk, abstract), `MataKuliahWajib` dan
  `MataKuliahPilihan` (turunan), `Manager` (controller).
- **Encapsulation**: field private (`_nama`, `_biaya`, `_sks`, `_semester`,
  `_dosenPengampu`) dengan getter/setter yang divalidasi.
- **Inheritance**: `MataKuliahWajib` dan `MataKuliahPilihan` mewarisi `MataKuliah`.
- **Polymorphism**: method `tampilkanInfo()` di-override berbeda di tiap class
  turunan, lalu objeknya disimpan dalam `List<MataKuliah>`.
- **Collection**: `List<MataKuliah>` di dalam `Manager`.
- **Higher Order Function**: `.where()` untuk pencarian, `.fold()` untuk
  menghitung total biaya dan total SKS.
- **Exception**: `DataTidakValidException` (custom) dilempar saat validasi
  gagal (nama kosong, biaya negatif, SKS ≤ 0, semester di luar rentang 1–14),
  ditangkap dengan try-catch di `main.dart` bersama `FormatException` untuk
  input angka yang salah format.
- **Async/Await**: `Manager.simpanData()` mensimulasikan proses penyimpanan
  dengan `Future.delayed(Duration(seconds: 2))`.

## Fitur Program
1. **Tambah Data** — menambahkan mata kuliah Wajib atau Pilihan.
2. **Lihat Semua Data** — menampilkan seluruh mata kuliah tersimpan.
3. **Cari Data** — mencari mata kuliah berdasarkan kata kunci pada nama.
4. **Hitung Total** — menghitung total biaya dan total SKS seluruh mata kuliah.
5. **Simpan Data** — simulasi penyimpanan data (async, jeda 2 detik).
6. **Keluar** — keluar dari program.

## Struktur Folder
```
project_uas/
├── bin/
│   └── main.dart
├── lib/
│   ├── models/
│   │   ├── mata_kuliah.dart
│   │   ├── mata_kuliah_wajib.dart
│   │   └── mata_kuliah_pilihan.dart
│   ├── controllers/
│   │   └── manager.dart
│   └── exceptions/
│       └── data_tidak_valid_exception.dart
├── pubspec.yaml
└── README.md
```

## Cara Menjalankan Program
1. Pastikan Dart SDK sudah terpasang (`dart --version`).
2. Masuk ke folder project:
   ```
   cd project_uas
   ```
3. Jalankan:
   ```
   dart run bin/main.dart
   ```
