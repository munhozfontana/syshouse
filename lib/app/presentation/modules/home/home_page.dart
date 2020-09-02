import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/mobx/patrimonio_store.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

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
            if (storePatrimonio.loadState == EnumLoadState.initial) {
              return Text("initial");
            } else if (storePatrimonio.loadState == EnumLoadState.loading) {
              return Text("Loading");
            } else {
              return storePatrimonio.reslist.fold(
                (l) => Text("Infelizmente Deu erro"),
                (r) => Column(
                  children: [
                    ...r.map((e) => Text(e.id)),
                  ],
                ),
              );
            }
          }),
        ));
  }
}
