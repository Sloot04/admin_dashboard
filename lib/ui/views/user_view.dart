import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

import '../cards/white_card.dart';

class UserView extends StatelessWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('User View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          WhiteCard(title: 'Sales Statistics', child: Text(uid)),
        ],
      ),
    );
  }
}
