import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () => Modular.to..pushNamed(Modular.initialRoute),
          ),
          ListTile(
            title: Text('Pessoas'),
            onTap: () => Modular.to.pushNamed('/pessoa/socio/list'),
          ),
          ListTile(
            title: Text('Patrimonio'),
            onTap: () => Modular.to.pushNamed('/patrimonio'),
          ),
        ],
      ),
    );
  }
}
