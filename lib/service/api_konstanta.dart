import 'package:http/http.dart' as https;

class Api {
  static var client = https.Client();
  // static var baseURL = 'http://sham-backend.test/api';
  static var linkURL = 'http://sham-backend.test';
  static var baseURL = '$linkURL/api';
  static var baseURLImage = '$linkURL/storage/images';
  // ngrok start web1
  // http tunnel ngrok = C:\Users\widia\AppData\Local\ngrok
  //untuk mengetahui port laravel = php artisan serve , dan port laravel harus dirubah agar tidak tabrakan
  //untuk mengubah port laravel = php artisan serve --port=8080
}
