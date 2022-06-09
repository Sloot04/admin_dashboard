import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';

import 'package:admin_dashboard/router/roter.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onFieldSubmitted: (_) => onFormSubmit(context, registerFormProvider),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese un nombre';
                            }
                            if (value.length < 2) {
                              return 'El nombre debe tener al menos 2 caracteres';
                            }
                            return null;
                          },
                          onChanged: (value) =>
                              registerFormProvider.name = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: Icons.supervised_user_circle_sharp),
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          onFieldSubmitted: (_) => onFormSubmit(context, registerFormProvider),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no válido';
                            }
                            return null;
                          },
                          onChanged: (value) =>
                              registerFormProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su correo',
                              label: 'Email',
                              icon: Icons.email),
                        ),
                        const SizedBox(height: 20),
                        // Password
                        TextFormField(
                          onFieldSubmitted: (_) => onFormSubmit(context, registerFormProvider),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese una contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                          onChanged: (value) =>
                              registerFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '******',
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded),
                        ),
                        const SizedBox(height: 20),
                        CustomOutlineButton(
                          isFilled: true,
                          onPressed: () => onFormSubmit(context, registerFormProvider),
                          text: 'Crear cuenta',
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Ir al login',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.loginRoute);
                          },
                        ),
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(context, RegisterFormProvider registerFormProvider) {
    final validForm = registerFormProvider.validateForm();
    if (!validForm) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.register(registerFormProvider.email,
        registerFormProvider.password, registerFormProvider.name);
  }
}
