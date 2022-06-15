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
          if (user != null) const _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            // TODO: Avatar
            _AvatarContainer(),

            // TODO:Formulario de actualización
            Container(
              height: 200,
              color: Colors.green,
            )
          ])
        ],
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: CustomLabels.h2,
              ),
              const SizedBox(height: 20),
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    const ClipOval(
                        child: Image(image: AssetImage('no-image.jpg'))),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          elevation: 0,
                          onPressed: () {
                            // TODO: Seleccionar imagen
                          },
                          child:
                              const Icon(Icons.camera_alt_outlined, size: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nombre de usuario',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
