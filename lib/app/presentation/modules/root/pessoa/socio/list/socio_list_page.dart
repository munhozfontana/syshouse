import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../components/core/app_bar_component.dart';
import "../../../../../components/core/drawer_component.dart";
import '../../../../../mobx/shared/enuns/enum_load_state.dart';
import 'socio_list_controller.dart';

class SocioListPage extends StatefulWidget {
  @override
  _SocioListPageState createState() {
    return _SocioListPageState();
  }
}

class _SocioListPageState
    extends ModularState<SocioListPage, SocioListController> {
  @override
  SocioListController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBarComponent().build(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            child: Observer(builder: (_) {
              if (controller.loadingStore.loadState == EnumLoadState.initial) {
                controller.init();
                return const Text("initial");
              } else if (controller.loadingStore.loadState ==
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
                              Modular.link.pushNamed('socio/add'),
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
                      rows: controller.resListSocios
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
                                  onTap: () => controller.removeItem(socio),
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
      ),
    );
  }
}
