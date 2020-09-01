import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/data/datasources/patrimonio_api.dart';
import 'package:syshouse/app/data/repositories/patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/patrimonio_store.dart';
import 'package:syshouse/core/network/http_adapter.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StorePatrimonio(listPatrimonio: i.get()), lazy: true),
        Bind((i) => ListPatrimonio(patrimonioRepository: i.get()), lazy: true),
        Bind(
            (i) => PatrimonioRepositoryImpl(
                  connectivityAdapter: i.get(),
                  patrimonioApi: i.get(),
                ),
            lazy: true),
        Bind(
            (i) => PatrimonioApiImpl(
                  httpAdapter: i.get(),
                  apiValidation: i.get(),
                ),
            lazy: true),
        Bind((i) => HttpAdapterImpl(
              client: i.get(),
              path: "patrimonio",
            )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];
}
