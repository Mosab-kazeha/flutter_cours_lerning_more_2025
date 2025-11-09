import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
setUp() async {
  prefs = await SharedPreferences.getInstance();
}
