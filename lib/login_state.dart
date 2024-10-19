import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool _isLogin = false;
  String _message = "";

  bool get isLogin => _isLogin;
  String get errorMessage => _message;

  void loggin(String username, String password) {
    if (username == "test") {
      if (password == "password") {
        _isLogin = true;
      } else {
        _message = "Password Salah";
        _isLogin = false;
      }
    } else {
      _message = "User Salah";
      _isLogin = false;
    }
    notifyListeners(); // Memberi tahu widget bahwa ada perubahan pada state
  }

  void logOut() {
    _isLogin = false;
    notifyListeners(); // Memberi tahu widget bahwa ada perubahan pada state
  }
}
