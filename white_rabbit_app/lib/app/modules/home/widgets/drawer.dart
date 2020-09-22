import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_rabbit_app/app/helpers/pickers/gradient_picker.dart';
import 'package:white_rabbit_app/app/helpers/pickers/icon_picker.dart';
import 'package:white_rabbit_app/app/modules/home/home_controller.dart';

class NavDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> key;

  NavDrawer({
    this.key,
  });

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends ModularState<NavDrawer, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          FutureBuilder(
            future: controller.getProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return DrawerHeader(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        IconPicker.getSvgPath(controller.profile.icon),
                        width: 70,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Nome: ${controller.profile.name}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Usuario: ${controller.profile.username}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(gradient: GradientPicker.getGradient()),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5),
                top: BorderSide(width: 0.5),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () async {
                await controller.logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
