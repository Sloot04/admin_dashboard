import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      // ignore: avoid_print
      print('Form valid... Register');
      // ignore: avoid_print
      print('$name ==== $email ==== $password');
      return true;
    } else {
      // ignore: avoid_print
      print('Register no valid');
      return false;
    }
  }
}
