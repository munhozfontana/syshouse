import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/socio_module.dart';

class PessoaModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/socio',
          module: SocioModule(),
        ),
        // ModularRouter(
        //   '/contato', module,
        // ),
        // ModularRouter(
        //   '/dependente'module,
        // )
      ];
}
