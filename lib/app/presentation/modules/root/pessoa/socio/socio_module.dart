import 'package:flutter_modular/flutter_modular.dart';

import 'add/socio_add_page.dart';
import 'list/socio_list_page.dart';

class SocioModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (context, args) => SocioListPage(),
        ),
        ModularRouter(
          '/add',
          child: (context, args) => SocioAddPage(),
        ),
      ];
}
