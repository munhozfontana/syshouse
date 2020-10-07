import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/components/loading_component.dart';

import '../../../../../mobx/enuns/enum_load_state.dart';
import 'socio_add_controller.dart';

class SocioAddPage extends StatefulWidget {
  @override
  _SocioAddPageState createState() {
    return _SocioAddPageState();
  }
}

class _SocioAddPageState
    extends ModularState<SocioAddPage, SocioAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, screen) {
          return Container(
            width: screen.maxWidth,
            child: Observer(builder: (_) {
              if (controller.loadingStore.loadState == EnumLoadState.initial) {
                controller.init();
                return const Text("initial");
              }
              var contentScreen = <Widget>[
                buildContentPage(screen),
              ];
              if (controller.loadingStore.loadState == EnumLoadState.loading) {
                contentScreen.add(LoadingComponent());
              }
              return Stack(
                children: contentScreen,
              );
            }),
          );
        },
      ),
    );
  }

  Column buildContentPage(BoxConstraints screen) {
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
