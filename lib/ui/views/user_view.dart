import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/models/usuario.dart';

import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    usersProvider
        .getUserById(widget.uid)
        .then(((userDB) => setState((() => user = userDB))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('User View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          if (user == null)
            WhiteCard(
                child: Container(
              alignment: Alignment.center,
              height: 300,
              child: const CircularProgressIndicator(),
            )),

          //  WhiteCard(title: 'Sales Statistics', child: Text(widget.uid)),
        ],
      ),
    );
  }
}
