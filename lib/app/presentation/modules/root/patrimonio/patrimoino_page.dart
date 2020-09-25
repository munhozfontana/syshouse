import 'package:flutter/material.dart';

import '../../../components/core/app_bar_component.dart';
import '../../../components/core/drawer_component.dart';

class PatrimonioPage extends StatefulWidget {
  @override
  _PatrimonioPageState createState() => _PatrimonioPageState();
}

class _PatrimonioPageState extends State<PatrimonioPage> {
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
