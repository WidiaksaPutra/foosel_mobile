import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPref{
  late SharedPreferences prefs;
  sharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
}