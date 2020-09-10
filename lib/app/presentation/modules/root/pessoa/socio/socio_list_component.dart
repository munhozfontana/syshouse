import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../mobx/socio_store.dart';
import '../../../../mobx/utils/enum_load_state.dart';

class SocioList extends StatelessWidget {
  final storeSocio = Modular.get<StoreSocio>();

  @override
  Widget build(BuildContext context) {
    storeSocio.listPage();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          child: Observer(builder: (_) {
            if (storeSocio.loadState == EnumLoadState.initial) {
              return const Text("initial");
            } else if (storeSocio.loadState == EnumLoadState.loading) {
              return const Text("Loading");
            } else {
              return storeSocio.reslistPage.fold(
                (l) => null,
                (r) => Column(
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
                      rows: r
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(Text(e.nome)),
                                DataCell(Text(e.profissao)),
                                DataCell(Text(e.cpf)),
                                DataCell(Text(e.estadoCivil)),
                                DataCell(Text(e.rg)),
                                DataCell(
                                  Icon(Icons.delete_forever),
                                  showEditIcon: false,
                                  onTap: () {
                                    print("tete");
                                  },
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    Spacer(),
                  ],
                ),
              );
            }
          }),
        );
      },
    );
  }
}
