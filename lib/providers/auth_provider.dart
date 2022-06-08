import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/http/auth_response.dart';

import 'package:admin_dashboard/router/roter.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus { checking, authenticated, notAutenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO: Petición HTTP;
    _token = 'dhkdgffhgbsgyshau87ggdsy.ahfuhudih.agyhdgd';
    LocalStorage.prefs.setString('token', _token!);

    // TODO: Navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {
    final data = {'nombre': name, 'correo': email, 'password': password};

    CafeApi.post('/usuarios', data).then((json) {
      // ignore: avoid_print
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners();

    }).catchError((e) {
      // ignore: avoid_print
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario existente');
    });
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
