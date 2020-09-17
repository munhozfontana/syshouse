import 'package:flutter/material.dart';

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
            onTap: () => Navigator.pushNamed(context, '/home'),
          ),
          ListTile(
            title: Text('Pessoas'),
            onTap: () => Navigator.pushNamed(context, '/pessoa/socio/list'),
          ),
          ListTile(
            title: Text('Patrimonio'),
            onTap: () => Navigator.pushNamed(context, '/patrimonio'),
          ),
        ],
      ),
    );
  }
}
