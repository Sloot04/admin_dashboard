import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    // TODO: Petición HTTP;
    _token = 'dhkdgffhgbsgyshau87ggdsy.ahfuhudih.agyhdgd';
    print('almacenar JWT: $_token');

    // TODO: Navegar al dashboard

    notifyListeners();
  }
}
