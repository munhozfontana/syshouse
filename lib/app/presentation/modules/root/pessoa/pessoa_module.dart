import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/network/http_adapter.dart';
import '../../../../data/datasources/patrimonio_api.dart';
import '../../../../data/datasources/socio_api.dart';
import '../../../../data/repositories/patrimonio_repository_impl.dart';
import '../../../../data/repositories/socio_repository_impl.dart';
import '../../../../domain/usecases/patrimonio_usecases.dart';
import '../../../../domain/usecases/socio_usecases.dart';
import 'pessoa_add_page.dart';
import 'socio/add/socio_add_controller.dart';
import 'socio/list/socio_list_controller.dart';
import 'socio/list/socio_list_page.dart';

class PessoaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SocioListController(
            deleteSocio: i.get(),
            listPageSocio: i.get(),
            loadingStore: i.get(),
          ),
        ),
        Bind(
          (i) => SocioAddController(
            listPatrimonio: i.get(),
            loadingStore: i.get(),
            saveSocio: i.get(),
          ),
        ),
        Bind((i) => SaveSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => ListPageSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => DeleteSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => ListSocio(socioRepository: i.get()), lazy: true),
        Bind(
            (i) => SocioRepositoryImpl(
                  socioApi: i.get(),
                  connectivityAdapter: i.get(),
                ),
            lazy: true),
        Bind(
            (i) => SocioApiImpl(
                  apiValidation: i.get(),
                  httpAdapter: HttpAdapterImpl(
                    path: 'socio',
                    client: i.get(),
                  ),
                ),
            lazy: true),
        Bind((i) => ListPatrimonio(patrimonioRepository: i.get()), lazy: true),
        Bind(
            (i) => PatrimonioRepositoryImpl(
                  connectivityAdapter: i.get(),
                  patrimonioApi: i.get(),
                ),
            lazy: true),
        Bind(
            (i) => PatrimonioApiImpl(
                  apiValidation: i.get(),
                  httpAdapter: HttpAdapterImpl(
                    path: 'patrimonio',
                    client: i.get(),
                  ),
                ),
            lazy: true),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (context, args) => SocioListPage(),
        ),
        ModularRouter(
          '/add',
          child: (context, args) => PessoaAddPage(),
        ),
        // ModularRouter('/socio-patrimonio', module: SocioPatrimonioModule()),
        // ModularRouter('/contato', module: ContatoModule()),
        // ModularRouter('/pagador', module: PagadorModule()),
      ];
}
