import 'package:flutter_modular/flutter_modular.dart';

import 'add/contato_add_page.dart';

class ContatoModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/add',
          child: (context, args) => ContatoAddPage(),
        )
      ];
}
