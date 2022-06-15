import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/datatables/users_datasource.dart';

import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Users View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                label: const Text('Nombre'),
                onSort: (index, _) {
                  usersProvider.sort<String>((usuario) => usuario.nombre);
                },
              ),
              DataColumn(
                label: const Text('Email'),
                onSort: (index, _) {
                  usersProvider.sort<String>((usuario) => usuario.correo);
                },
              ),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Acciones')),
            ],
            source: usersDataSource,
          )
        ],
      ),
    );
  }
}
