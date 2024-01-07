import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  saveLogin(login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", login);
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('login');
  }
}
