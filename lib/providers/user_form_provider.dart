import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TODO: actualizar el usuario

  bool validForm (){
    return formKey.currentState!.validate();
  }

}
