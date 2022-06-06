import 'package:flutter/material.dart';

import '../../shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEDF1F2),
        body: Row(
          children: [
            //TODO: esto depende si es mas de 700px
            const Sidebar(),

            // Contenedor de nuestro view
            Expanded(child: child)
          ],
        ));
  }
}
