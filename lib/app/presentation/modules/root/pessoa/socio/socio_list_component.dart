import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';

import '../../../../mobx/socio_store.dart';

class SocioList extends StatefulWidget {
  @override
  _SocioListState createState() => _SocioListState();
}

class _SocioListState extends State<SocioList> {
  final storeSocio = Modular.get<StoreSocio>();

  @override
  void initState() {
    super.initState();
    storeSocio.listPage();
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
                                onTap: () => storeSocio.delete(socio),
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
