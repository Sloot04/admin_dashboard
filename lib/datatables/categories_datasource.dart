import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow getRow(int index) {
    final category = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                 
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('¿Está seguro de borrarlo?'),
                    content:
                        Text('¿Borrar definitivamente ${category.nombre}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Si, borrar'))
                    ],
                  );

                  showDialog(context: context, builder: (_) => dialog);
                },
                icon: Icon(Icons.delete_outline,
                    color: Colors.red.withOpacity(0.8))),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
