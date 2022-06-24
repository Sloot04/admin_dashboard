import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  late GlobalKey<FormState> formKey;

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
        rol: rol ?? user!.rol,
        estado: estado ?? user!.estado,
        google: google ?? user!.google,
        nombre: nombre ?? user!.nombre,
        correo: correo ?? user!.correo,
        uid: uid ?? user!.uid,
        img: img ?? user!.img);
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future<bool> updateUser() async {
    if (!_validForm()) return false;
    final data = {'nombre': user!.nombre, 'correo': user!.correo};

    try {
      final resp = await CafeApi.put('/usuarios/${user!.uid}', data);
      print(resp);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await CafeApi.uploadFile(path, bytes);
      user = Usuario.fromMap(resp);
      notifyListeners();
      return user!;
    } catch (e) {
      print(e);
      throw 'Error en user form provider';
    }
  }
}
