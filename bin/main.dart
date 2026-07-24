import 'dart:io';
import '../lib/models/mata_kuliah_wajib.dart';
import '../lib/models/mata_kuliah_pilihan.dart';
import '../lib/controllers/manager.dart';
import '../lib/exceptions/data_tidak_valid_exception.dart';

void main() async {
  final manager = Manager();
  bool jalan = true;

  // Data contoh awal, supaya menu 2/3/4 langsung ada isinya saat didemokan.
  try {
    manager.tambah(
        MataKuliahWajib('Pemrograman Berorientasi Objek', 150000, 3, 4));
    manager.tambah(
        MataKuliahPilihan('Kecerdasan Buatan', 200000, 3, 'Dr. Andi Wijaya'));
  } catch (e) {
    print(e);
  }

  while (jalan) {
    print('\n===== SISTEM AKADEMIK =====');
    print('1. Tambah Data');
    print('2. Lihat Semua Data');
    print('3. Cari Data');
    print('4. Hitung Total');
    print('5. Simpan Data');
    print('6. Keluar');
    stdout.write('Pilih menu: ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tambahData(manager);
        break;
      case '2':
        print('\n-- Daftar Mata Kuliah --');
        manager.tampilkanSemua();
        break;
      case '3':
        cariData(manager);
        break;
      case '4':
        print('\nTotal biaya seluruh mata kuliah: '
            'Rp${manager.hitungTotal().toStringAsFixed(0)}');
        print('Total SKS: ${manager.hitungTotalSks()}');
        break;
      case '5':
        await manager.simpanData();
        break;
      case '6':
        jalan = false;
        print('Terima kasih. Program selesai.');
        break;
      default:
        print('Pilihan tidak dikenali, coba lagi.');
    }
  }
}

/// Menu 1: Tambah Data — dibungkus try-catch untuk menangani
/// input yang salah format maupun data yang tidak valid.
void tambahData(Manager manager) {
  try {
    stdout.write('Jenis mata kuliah (1=Wajib, 2=Pilihan): ');
    String? jenis = stdin.readLineSync();

    stdout.write('Nama mata kuliah: ');
    String nama = stdin.readLineSync() ?? '';

    stdout.write('Biaya: ');
    double biaya = double.parse(stdin.readLineSync() ?? '');

    stdout.write('SKS: ');
    int sks = int.parse(stdin.readLineSync() ?? '');

    if (jenis == '1') {
      stdout.write('Semester: ');
      int semester = int.parse(stdin.readLineSync() ?? '');
      manager.tambah(MataKuliahWajib(nama, biaya, sks, semester));
    } else if (jenis == '2') {
      stdout.write('Dosen pengampu: ');
      String dosen = stdin.readLineSync() ?? '';
      manager.tambah(MataKuliahPilihan(nama, biaya, sks, dosen));
    } else {
      print('Jenis tidak dikenali. Data batal ditambahkan.');
      return;
    }
    print('Data berhasil ditambahkan.');
  } on DataTidakValidException catch (e) {
    print(e);
  } on FormatException {
    print('Error: input angka tidak valid.');
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}

/// Menu 3: Cari Data — menggunakan Manager.cari() (HOF where()).
void cariData(Manager manager) {
  stdout.write('Masukkan kata kunci: ');
  String keyword = stdin.readLineSync() ?? '';
  var hasil = manager.cari(keyword);
  if (hasil.isEmpty) {
    print('Tidak ditemukan mata kuliah dengan kata kunci "$keyword".');
  } else {
    print('\n-- Hasil Pencarian --');
    for (var item in hasil) {
      item.tampilkanInfo();
    }
  }
}
