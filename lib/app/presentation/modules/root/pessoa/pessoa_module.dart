import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pessoa_page.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pessoa_store.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/add/socio_add_controller.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/list/socio_list_page.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio_patrimonio/add/socio_patrimonio_add_controller.dart';

import '../../../../../core/network/http_adapter.dart';
import '../../../../data/datasources/patrimonio_api.dart';
import '../../../../data/datasources/socio_api.dart';
import '../../../../data/datasources/socio_patrimonio_api.dart';
import '../../../../data/repositories/patrimonio_repository_impl.dart';
import '../../../../data/repositories/socio_patrimonio_repository_impl.dart';
import '../../../../data/repositories/socio_repository_impl.dart';
import '../../../../domain/usecases/patrimonio_usecases.dart';
import '../../../../domain/usecases/socio_patrimonio_usecases.dart';
import '../../../../domain/usecases/socio_usecases.dart';
import 'socio/list/socio_list_controller.dart';

class PessoaModule extends ChildModule {
  List<Bind> controllers = [
    Bind(
      (i) => SocioListController(
        deleteSocio: i.get(),
        listPageSocio: i.get(),
        loadingStore: i.get(),
      ),
    ),
    Bind((i) => SocioAddController(
          pessoaStore: i.get(),
          loadingStore: i.get(),
          saveSocio: i.get(),
        )),
    Bind((i) => SocioPatrimonioAddController()),
    Bind((i) => PessoaStore()),
  ];

  List<Bind> apis = [
    Bind(
      (i) => SocioPatrimonioApiImpl(
        apiValidation: i.get(),
        httpAdapter: HttpAdapterImpl(
          path: 'sociopatrimonio',
          client: i.get(),
        ),
      ),
    ),
    Bind(
        (i) => SocioApiImpl(
              apiValidation: i.get(),
              httpAdapter: HttpAdapterImpl(
                path: 'socio',
                client: i.get(),
              ),
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

  List<Bind> usecases = [
    Bind((i) => SaveSocioPatrimonio(sociopatrimonioRepository: i.get())),
    Bind((i) => SaveSocio(socioRepository: i.get()), lazy: true),
    Bind((i) => ListPageSocio(socioRepository: i.get()), lazy: true),
    Bind((i) => DeleteSocio(socioRepository: i.get()), lazy: true),
    Bind((i) => ListSocio(socioRepository: i.get()), lazy: true),
  ];

  List<Bind> repositories = [
    Bind((i) => SocioPatrimonioRepositoryImpl(
          connectivityAdapter: i.get(),
          sociopatrimonioApi: i.get(),
        )),
    Bind(
        (i) => SocioRepositoryImpl(
              socioApi: i.get(),
              connectivityAdapter: i.get(),
            ),
        lazy: true),
    Bind((i) => ListPatrimonio(patrimonioRepository: i.get()), lazy: true),
    Bind(
        (i) => PatrimonioRepositoryImpl(
              connectivityAdapter: i.get(),
              patrimonioApi: i.get(),
            ),
        lazy: true),
  ];

  @override
  List<Bind> get binds => [
        ...controllers,
        ...apis,
        ...usecases,
        ...repositories,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (context, args) => SocioListPage(),
        ),
        ModularRouter(
          '/add',
          child: (context, args) => PessoaPage(),
        ),
        // ModularRouter(
        //   '/socio-patrimonio',
        //   module: SocioPatrimonioModule(),
        // ),
      ];
}
