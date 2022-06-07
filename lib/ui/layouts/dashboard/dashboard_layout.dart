import 'package:flutter/material.dart';

import '../../shared/navbar.dart';
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
            Expanded(
              child: Column(
                children: [
                  // Navbar
                  const Navbar(),
                  // View
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ));
  }
}
