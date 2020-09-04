import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/mobx/socio_store.dart';

class PatrimonioPage extends StatefulWidget {
  @override
  _PatrimonioPageState createState() => _PatrimonioPageState();
}

class _PatrimonioPageState extends State<PatrimonioPage> {
  final storeSocio = Modular.get<StoreSocio>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("Patrimonio Works"),
      ),
    );
  }
}
