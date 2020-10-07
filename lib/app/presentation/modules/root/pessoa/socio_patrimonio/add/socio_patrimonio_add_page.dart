import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/components/loading_component.dart';
import 'package:syshouse/app/presentation/mobx/enuns/enum_load_state.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio_patrimonio/add/socio_patrimonio_add_controller.dart';

class SocioPatrimonioAddPage extends StatefulWidget {
  @override
  _SocioPatrimonioAddPageState createState() => _SocioPatrimonioAddPageState();
}

class _SocioPatrimonioAddPageState
    extends ModularState<SocioPatrimonioAddPage, SocioPatrimonioAddController> {
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

  buildContentPage(BoxConstraints screen) {}
}
