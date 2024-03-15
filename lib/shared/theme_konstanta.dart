import 'package:intl/intl.dart';

NumberFormat formatCurrency = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 0,
  symbol: "Rp",
  // symbol: "\$",
  // locale: "en_AS",
  // customPattern: '\u00a4#,###',
  // decimalDigits: 0,
);

NumberFormat formatCurrencyNotSymbol = NumberFormat.currency(
  locale: 'id_ID',
  decimalDigits: 0,
  symbol: "",
);

NumberFormat formatCurrencyShort = NumberFormat.compact(locale: "id_ID", explicitSign: false);

const String emailKosong = "email anda belum diisi...";
const String passwordKosong = "password anda belum diisi...";
const String fullNameKosong = "nama lengkap anda belum diisi...";
const String usernameKosong = "username anda belum diisi...";
const String alamatKosong = "alamat anda belum diisi...";
const String nameProductKosong = "nama product anda belum diisi...";
const String priceProductKosong = "harga product anda belum diisi...";
const String descriptionProduct = "description product diisi dengan benar..!";
const String typeProductKosong = "type product anda belum dipilih...";
const String priceProductLebih = "harga product anda melebihi 16 digit...";

const String snackBarLoginBerhasil = "Login Berhasil";
const String snackBarLoginSalah = "Username atau Password Salah";
const String snackBarLoginGagal = "Login Gagal";

const String snackBarRegisterBerhasil = "Registrasi Berhasil";
const String snackBarRegisterSudahTersedia = "Registrasi Sudah Tersedia";
const String snackBarRegistrasiGagal = "Registrasi Gagal";

const String snackBarUpdateBerhasil = "Update Berhasil";
const String snackBarUpdateSudahTersedia = "Update Sudah Tersedia";
const String snackBarUpdateGagal = "Update Gagal";
const String snackBarUpdateKosong = "Anda Belum Mengisi Data Update";

const String snackBarProdukGagal = "Produk Gagal Ditambahkan";
const String snackBarProdukBerhasil = "Produk Berhasil Ditambahkan";

const String apakahProductDihapus = "apakah anda yakin ingin menghapus product ini..?";
const String apakahTransaksiDihapus = "apakah anda yakin ingin menghapus history transaksi ini..?";
const String apakahTransaksiRejected = "apakah anda yakin ingin rejected transaksi ini..?";
const String apakahTransaksiApproved = "apakah anda yakin ingin approved transaksi ini..?";

const String titleConnectingCheck = "Koneksi Internet Buruk";
const String childConnectingCheck = "penggunaan aplikasi akan dibatasi karena aplikasi dalam mode offline";

const String delleteMessageUser = "apakah anda yakin ingin menghapus user message ini..?";

const List coverFoosel = [
  "asset/image/cover_image_1.jpg",
  "asset/image/cover_image_2.jpg",
  "asset/image/cover_image_3.jpg",
  "asset/image/cover_image_4.jpg",
  "asset/image/cover_image_5.jpg",
];