import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/router/roter.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'main'),
          MenuItems(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.compass_calibration_outlined,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MenuItems(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              onPressed: () {}),
          MenuItems(
              text: 'Analytic',
              icon: Icons.show_chart_outlined,
              onPressed: () {}),
          MenuItems(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
              text: 'Categories',
              icon: Icons.layers_outlined,
              onPressed: () => navigateTo(Flurorouter.categoriesRoute)),
          MenuItems(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              onPressed: () {}),
          MenuItems(
              text: 'Discount',
              icon: Icons.attach_money_outlined,
              onPressed: () {}),
          MenuItems(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.usersRoute,
              text: 'Users',
              icon: Icons.people_alt_outlined,
              onPressed: () => navigateTo(Flurorouter.usersRoute)),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          MenuItems(
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () => navigateTo(Flurorouter.iconsRoute)),
          MenuItems(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          MenuItems(
              text: 'Campaing',
              icon: Icons.note_add_outlined,
              onPressed: () {}),
          MenuItems(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Blank',
              icon: Icons.post_add_outlined,
              onPressed: () => navigateTo(Flurorouter.blankRoute)),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Exit'),
          MenuItems(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff092044),
              Color(0xff092040),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ]);
}
