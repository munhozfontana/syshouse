import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/domain/entities/socio.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';

import '../../../../mobx/socio_store.dart';

class SocioList extends StatefulWidget {
  @override
  _SocioListState createState() {
    return _SocioListState();
  }
}

class _SocioListState extends State<SocioList> with WidgetsBindingObserver {
  final storeSocio = Modular.get<StoreSocio>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    storeSocio.listPage();
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    Modular.dispose<StoreSocio>();
  }

  void removeItem(Socio socio) async {
    await storeSocio.delete(socio);
    await autorun((_) {
      if (!storeSocio.showError.getHasError) {
        storeSocio.listPage();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      print(state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          child: Observer(builder: (_) {
            if (storeSocio.loadingStore.loadState == EnumLoadState.initial) {
              return const Text("initial");
            } else if (storeSocio.loadingStore.loadState ==
                EnumLoadState.loading) {
              return const Text("Loading");
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  RaisedButton(
                      child: Text('Adicionar'),
                      onPressed: () => {
                            Navigator.of(context).pushNamed('socio/add'),
                          }),
                  Spacer(),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Nome')),
                      DataColumn(label: Text('Profissão')),
                      DataColumn(label: Text('Cpf')),
                      DataColumn(label: Text('Estado Civil')),
                      DataColumn(label: Text('RG')),
                      DataColumn(label: Text('Ação')),
                    ],
                    rows: storeSocio.reslistPage
                        .map(
                          (socio) => DataRow(
                            cells: [
                              DataCell(Text(socio.nome)),
                              DataCell(Text(socio.profissao)),
                              DataCell(Text(socio.cpf)),
                              DataCell(Text(socio.estadoCivil)),
                              DataCell(Text(socio.rg)),
                              DataCell(
                                Icon(Icons.delete_forever),
                                showEditIcon: false,
                                onTap: () => removeItem(socio),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  Spacer(),
                ],
              );
            }
          }),
        );
      },
    );
  }
}
