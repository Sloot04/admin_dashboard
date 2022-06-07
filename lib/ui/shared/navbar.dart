import 'package:flutter/material.dart';

import 'widgets/navbar_avatar.dart';
import 'widgets/notifications_indicator.dart';
import 'widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(children: [
        //TODO: icono del menú
        IconButton(icon: const Icon(Icons.menu_outlined), onPressed: () {}),
        const SizedBox(width: 5),

        //Search input
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: const SearchText(),
        ),
        const Spacer(),
        const NotificationsIndicator(),
        const SizedBox(width: 10),
        const NavbarAvatar(),
        const SizedBox(width: 10),
      ]),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
