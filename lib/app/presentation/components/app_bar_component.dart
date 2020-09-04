import 'package:flutter/material.dart';

Widget appBarComponent(String title, MediaQueryData mediaQuery) {
  return AppBar(
    actions: [
      Container(
        margin: EdgeInsets.only(right: mediaQuery.size.width * 0.025),
        child: Center(
          child: Text("Thiago M.", style: TextStyle(fontSize: 23)),
        ),
      )
    ],
    leading: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        iconSize: 25,
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
    ),
    title: Text(title, style: TextStyle(fontSize: 23)),
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
