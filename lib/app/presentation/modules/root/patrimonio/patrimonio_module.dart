import 'package:flutter_modular/flutter_modular.dart';

import 'patrimoino_page.dart';

class PatrimonioModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => PatrimonioPage()),
      ];
}
