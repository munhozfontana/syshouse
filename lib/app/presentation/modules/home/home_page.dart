import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/mobx/patrimonio_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storePatrimonio = Modular.get<StorePatrimonio>();

  @override
  void initState() {
    super.initState();
    storePatrimonio.list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Observer(builder: (_) {
            return Text(storePatrimonio.reslist.length.toString());
          }),
        ));
  }
}
