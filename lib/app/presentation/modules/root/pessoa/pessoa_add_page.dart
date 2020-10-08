import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/add/socio_add_page_model.dart';

import '../../../../presentation/modules/root/pessoa/pessoa_add_controller.dart';

class PessoaAddPage extends StatefulWidget {
  @override
  _PessoaAddPageState createState() => _PessoaAddPageState();
}

class _PessoaAddPageState
    extends ModularState<PessoaAddPage, PessoaAddController>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller.setTabBarController(TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    ));
  }

  @override
  void dispose() {
    controller.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("aa"),
    );
    // Scaffold(
    //   appBar: AppBarComponent(
    //     bottom: TabBar(
    //       controller: controller.tabController,
    //       tabs: [
    //         Container(child: Text("1")),
    //         Container(child: Text("2")),
    //         // Tab(icon: Icon(Icons.person)),
    //         // Tab(icon: Icon(Icons.directions_transit)),
    //         // Tab(icon: Icon(Icons.directions_transit)),
    //         // Tab(icon: Icon(Icons.directions_bike)),
    //       ],
    //     ),
    //   ).build(context),
    //   body: WillPopScope(
    //     onWillPop: controller.activatePop,
    //     child: TabBarView(
    //       physics: NeverScrollableScrollPhysics(),
    //       controller: controller.tabController,
    //       children: [
    //         SocioAddPage(
    //           save: saveSocio,
    //           cancel: () => print("Log Back"),
    //         ),
    //         SocioPatrimonioAddPage(
    //           save: saveSocioPatrimonio,
    //           cancel: () => print("Log Back"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  void saveSocio(SocioAddPageModel socioModel) {
    controller.callSaveSocio(
      socioModel: SocioModel(
        cpf: socioModel.cpf,
        estadoCivil: socioModel.estadoCivil,
        nacionalidade: socioModel.nacionalidade,
        nome: socioModel.nome,
        profissao: socioModel.profissao,
        rg: socioModel.rg,
      ),
    );
  }

  void saveSocioPatrimonio(Object p1) {
    controller.callSaveSocioPatrimonio(
      socioPatrimonioModel: SocioPatrimonioModel(
        socioId: "",
        patrimonioId: "",
        porcentagem: 0,
        proprietario: true,
      ),
    );
  }
}
