import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/components/core/app_bar_component.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';

import 'socio_add_controller.dart';

class SocioAddPage extends StatefulWidget {
  @override
  _SocioAddPageState createState() {
    return _SocioAddPageState();
  }
}

class _SocioAddPageState extends ModularState<SocioAddPage, SocioAddController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        setState(() {
          _tabController.index = 0;
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.activatePop,
      child: Scaffold(
        appBar: AppBarComponent(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ).build(context),
        body: LayoutBuilder(
          builder: (context, screen) {
            return Container(
              width: screen.maxWidth,
              child: Observer(builder: (_) {
                if (controller.loadingStore.loadState ==
                    EnumLoadState.initial) {
                  controller.init();
                  return const Text("initial");
                } else if (controller.loadingStore.loadState ==
                    EnumLoadState.loading) {
                  return const Text("Loading");
                } else {
                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      buildSocio(screen, context),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                    ],
                  );
                }
              }),
            );
          },
        ),
      ),
    );
  }

  Column buildSocio(BoxConstraints screen, BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(screen.maxWidth * 0.2, 50),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                  ),
                  controller: controller.nomeSocio,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(screen.maxWidth * 0.2, 50),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Cpf',
                  ),
                  controller: controller.cpfSocio,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(screen.maxWidth * 0.2, 50),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Rg',
                  ),
                  controller: controller.rgSocio,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(screen.maxWidth * 0.2, 50),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nacionalidade',
                  ),
                  controller: controller.nacionalidadeSocio,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(screen.maxWidth * 0.2, 50),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Estado Cívil',
                  ),
                  controller: controller.estadoCivilSocio,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(screen.maxWidth * 0.2, 50),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Profissão',
                  ),
                  controller: controller.profissaoSocio,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Spacer(),
            RaisedButton(child: Text("Cancelar"), onPressed: () {}),
            Spacer(),
            RaisedButton(
              child: Text("Salvar"),
              onPressed: controller.salvarSocio,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ],
    );
  }
}

// Socio Patriominio

class SocioPatriomonioAddPage extends StatelessWidget {
  // final socio

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
