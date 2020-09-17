import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../mobx/shared/user_logged.dart';

class AppBarComponent extends StatelessWidget {
  final String data;

  const AppBarComponent({
    Key key,
    this.data = "title",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLogged = Modular.get<UserLogged>();

    return AppBar(
      actions: [
        Container(
          margin: EdgeInsets.only(right: 25),
          child: Center(
            child: Text(userLogged.name, style: TextStyle(fontSize: 23)),
          ),
        )
      ],
      title: Text(
        data,
        style: TextStyle(fontSize: 23),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[Color(0xff699BDC), Color(0xff517EB9)],
          ),
        ),
      ),
    );
  }
}
