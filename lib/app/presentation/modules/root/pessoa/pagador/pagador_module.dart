import 'package:flutter_modular/flutter_modular.dart';

import 'add/pagador_add_page.dart';

class PagadorModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/add',
          child: (context, args) => PagadorAddPage(),
        )
      ];
}
