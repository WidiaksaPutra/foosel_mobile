import 'package:shared_preferences/shared_preferences.dart';

mixin defaultSharedPref{
  late SharedPreferences prefs;
  sharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
}