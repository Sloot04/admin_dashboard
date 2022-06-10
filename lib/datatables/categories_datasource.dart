import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;

  CategoriesDTS(this.categorias);

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
                  print('Editando: $category');
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(
                onPressed: () {
                  print('Eliminando: $category');
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
