import 'package:flutter/material.dart';

import '../../shared/navbar.dart';
import '../../shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) const Sidebar(),
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
            ),
            if (size.width < 700) const Sidebar(),
          ],
        ));
  }
}
