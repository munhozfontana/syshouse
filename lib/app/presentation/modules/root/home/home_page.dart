import 'package:flutter/material.dart';
import 'package:syshouse/app/presentation/components/core/app_bar_component.dart';
import 'package:syshouse/app/presentation/components/core/drawer_component.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().build(context),
      drawer: DrawerComponent(),
      body: Container(
        child: Text("Home Works"),
      ),
    );
  }
}
