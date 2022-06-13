import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;

  const CategoryModal({Key? key, this.categoria}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.categoria?.nombre ?? 'Nueva Cateoría',
                  style: CustomLabels.h1.copyWith(color: Colors.white)),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_outlined, color: Colors.white))
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la categoría',
              label: 'Categoría',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlineButton(
              onPressed: () async {
                print(nombre);
                if (id == null) {
                  // Crear categoría
                  await categoryProvider.newCategory(nombre);
                } else {}
                Navigator.of(context).pop();
              },
              text: 'Guardar',
              isTextWhite: true,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: const Color(0xff0F2041).withOpacity(0.9),
      boxShadow: const [BoxShadow(color: Colors.black26)]);
}
