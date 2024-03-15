// ignore_for_file: unused_import

import 'package:http/http.dart' as https;
// import 'package:http/http.dart' as http;

class Api {
  static var client = https.Client();
  // static var client = http.Client();
  // static var baseURL = 'http://sham-backend.test/api';
  // static var linkURL = 'http://foosel_backend.test';
  // static var linkURL = 'https://fooselwoodcraftbali.com';
  static var linkURL = 'https://fooselwoodcraftbali.com';  
  static var baseURL = '$linkURL/api';
  // static var baseURLImage = '$linkURL/storage/images';
  // ngrok start web1
  // http tunnel ngrok = C:\Users\widia\AppData\Local\ngrok
  //untuk mengetahui port laravel = php artisan serve , dan port laravel harus dirubah agar tidak tabrakan
  //untuk mengubah port laravel = php artisan serve --port=8080
}
