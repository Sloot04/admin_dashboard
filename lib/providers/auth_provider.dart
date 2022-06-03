import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAutenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO: Petición HTTP;
    _token = 'dhkdgffhgbsgyshau87ggdsy.ahfuhudih.agyhdgd';
    LocalStorage.prefs.setString('token', _token!);

    // TODO: Navegar al dashboard

    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAutenticated;
      notifyListeners();
      return false;
    }
    //TODO: ir al backend y comprobar si el JWT es válido;
    await Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
