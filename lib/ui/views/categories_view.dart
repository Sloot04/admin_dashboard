import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

import '../cards/white_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Categories View', style: CustomLabels.h1),
        const SizedBox(height: 10),
        const WhiteCard(
            title: 'Categorías titulo', child:  Text('Hola Mundno')),
      ],
    );
  }
}