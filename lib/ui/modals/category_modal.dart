import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/category.dart';

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
    return Container(
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: const Color(0xff0F2041).withOpacity(0.9),
      boxShadow: const [BoxShadow(color: Colors.black26)]);
}
