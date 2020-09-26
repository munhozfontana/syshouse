import 'package:flutter_modular/flutter_modular.dart';

import 'add/socio_patrimonio_add_page.dart';

class SocioPatrimonioModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/add',
          child: (context, args) => SocioPatrimonioAddPage(),
        )
      ];
}
