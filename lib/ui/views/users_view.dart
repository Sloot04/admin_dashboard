import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

import '../cards/white_card.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Users View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          const WhiteCard(
              title: 'Sales Statistics', child:  Text('Hola Mundno')),
        ],
      ),
    );
  }
}