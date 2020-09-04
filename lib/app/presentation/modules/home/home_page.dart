import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/mobx/socio_store.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storeSocio = Modular.get<StoreSocio>();

  @override
  void initState() {
    super.initState();
    storeSocio.listPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Observer(
            builder: (_) {
              if (storeSocio.loadState == EnumLoadState.initial) {
                return Text("initial");
              } else if (storeSocio.loadState == EnumLoadState.loading) {
                return Text("Loading");
              } else {
                return storeSocio.reslistPage.fold(
                  (l) => Text("Infelizmente Deu erro"),
                  (r) => Column(
                    children: [
                      ...r.map((e) => Text(e.id)),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
