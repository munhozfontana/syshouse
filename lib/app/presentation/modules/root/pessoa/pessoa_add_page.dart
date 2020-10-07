import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/components/core/app_bar_component.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/contato/add/contato_add_page.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pagador/add/pagador_add_page.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pessoa_add_controller.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/add/socio_add_page.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio_patrimonio/add/socio_patrimonio_add_page.dart';

class PessoaAddPage extends StatefulWidget {
  @override
  _PessoaAddPageState createState() => _PessoaAddPageState();
}

class _PessoaAddPageState
    extends ModularState<PessoaAddPage, PessoaAddController>
    with SingleTickerProviderStateMixin {
  final componentPages = [
    SocioAddPage(),
    SocioPatrimonioAddPage(),
    PagadorAddPage(),
    ContatoAddPage(),
  ];

  @override
  void initState() {
    super.initState();
    controller.setTabBarController(TabController(
      length: componentPages.length,
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
    return Scaffold(
      appBar: AppBarComponent(
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ).build(context),
      body: WillPopScope(
        onWillPop: controller.activatePop,
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: componentPages,
        ),
      ),
    );
  }
}
