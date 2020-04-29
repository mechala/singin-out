import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;
  String _email = "";
  String _password = "";

  void actualizar() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("loggedIn", _loggedIn);
    prefs.setString("email", _email);
    prefs.setString("password", _password);
  }

  void recibir() async {

    final prefs = await SharedPreferences.getInstance();
   if( prefs.getBool("loggedIn")!=null){
    _loggedIn = prefs.getBool("loggedIn");}
    if( prefs.getString("email")!=null){
    _email = prefs.getString("email");
    }
    if( prefs.getString("password")!=null){
    _password = prefs.getString("password");
    }
  }

  String getEmail() => _email;
  String getPassword() => _password;

  bool isLoggedIn() => _loggedIn;

  void login() {
    _loggedIn = true;
    actualizar();
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    actualizar();
    notifyListeners();
  }

  void singUp(email, password) {
    _password = password;

    _email = email;
    actualizar();
    notifyListeners();
  }
}
