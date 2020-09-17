import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/data/datasources/patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/socio_api.dart';
import 'package:syshouse/app/data/repositories/patrimonio_repository_impl.dart';
import 'package:syshouse/app/data/repositories/socio_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/patrimonio_usecases.dart';
import 'package:syshouse/app/domain/usecases/socio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/patrimonio_store.dart';
import 'package:syshouse/app/presentation/mobx/socio_store.dart';
import 'package:syshouse/core/network/http_adapter.dart';

import 'socio_add_component.dart';
import 'socio_edit_component.dart';
import 'socio_list_component.dart';

@override
class SocioModule extends ChildModule {
  List<Bind> get binds => [
        Bind(
            (i) => StoreSocio(
                listPageSocio: i.get(),
                saveSocio: i.get(),
                deleteSocio: i.get(),
                loadingStore: i.get(),
                showError: i.get()),
            lazy: true),
        Bind((i) => SaveSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => ListPageSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => DeleteSocio(socioRepository: i.get()), lazy: true),
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
        // PATRIMONIO
        Bind(
          (i) => StorePatrimonio(
            listPatrimonio: i.get(),
            loadingStore: i.get(),
            showError: i.get(),
          ),
          lazy: true,
        ),
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
          '/list',
          child: (context, args) => SocioList(),
        ),
        ModularRouter('/add', child: (context, args) => SocioAdd()),
        ModularRouter('/edit', child: (context, args) => SocioEdit()),
      ];
}
