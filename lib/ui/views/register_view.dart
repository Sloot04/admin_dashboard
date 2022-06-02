import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/roter.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                // validator: :(),
                style: const TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_sharp),
              ),
              const SizedBox(height: 20),
              // Email
              TextFormField(
                // validator: :(),
                style: const TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email),
              ),
              const SizedBox(height: 20),
              // Password
              TextFormField(
                // validator: :(),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                    hint: '******',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded),
              ),
              const SizedBox(height: 20),
              CustomOutlineButton(
                isFilled: true,
                onPressed: () {},
                text: 'Crear cuenta',
              ),
              const SizedBox(height: 20),
              LinkText(
                text: 'Ir al login',
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              ),
            ],
          )),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white.withOpacity(0.3),
      )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white.withOpacity(0.3),
      )),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
