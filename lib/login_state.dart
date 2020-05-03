import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginState with ChangeNotifier {
  bool _loaded=false;
  bool _loggedIn = false;
  String _email = "";
  String _password = "";
  String _username = "";
  String _token = "";
  String _name = "";
  
  
  
  

  void actualizar() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("loggedIn", _loggedIn);
    prefs.setString("email", _email);
    /* prefs.setString("password", _password); */
    prefs.setString("username", _username);
    prefs.setString("token", _token);
  }

  void recibir() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("loggedIn") != null) {
      _loggedIn = prefs.getBool("loggedIn");
    }
    if (prefs.getString("email") != null) {
      _email = prefs.getString("email");
    }
    /* if (prefs.getString("password") != null) {
      _password = prefs.getString("password");
    } */
    if (prefs.getString("token") != null) {
      _token = prefs.getString("token");
    }
    if (prefs.getString("username") != null) {
      _username = prefs.getString("username");
    }
    _loaded=true;
    notifyListeners();
  }

  String getEmail() => _email;
  String getPassword() => _password;
  String getToken() => _token;
  String getUsername() => _username;
  bool isLoggedIn() => _loggedIn;
  bool isLoaded() =>_loaded;


  void login(String email,String password) async {
     final http.Response response = await http.post(
      'https://movil-api.herokuapp.com/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': password
      }),
    );

    print('${response.body}');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.body}');
      _loggedIn = true;
    } else {
      print("signup failed");
      print('${response.body}');
     //throw Exception(response.body);
    }

  
    

    actualizar();
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    actualizar();
    notifyListeners();
  }

  void singUp(email, password, username, name) async {
    _email = email;
    _password = password;
    _username = username;
    _name = name;
     final http.Response response = await http.post(
      'https://movil-api.herokuapp.com/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,'password': password,'username': username,'name': name
      }),
    );

    print('${response.body}');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.body}');
      } else {
      print("signup failed");
      print('${response.body}');
    //throw Exception(response.body);
    }
    actualizar();
    
    notifyListeners();
  }
}
