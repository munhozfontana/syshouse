import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/network/http_adapter.dart';
import '../../../../data/datasources/patrimonio_api.dart';
import '../../../../data/datasources/socio_api.dart';
import '../../../../data/repositories/patrimonio_repository_impl.dart';
import '../../../../data/repositories/socio_repository_impl.dart';
import '../../../../domain/usecases/patrimonio_usecases.dart';
import '../../../../domain/usecases/socio_usecases.dart';
import '../../../mobx/patrimonio_store.dart';
import '../../../mobx/socio_store.dart';
import 'pages/pessoa_page_edit.dart';
import 'pages/pessoa_page_list.dart';
import 'pages/pessoa_page_new.dart';

class PessoaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StorePatrimonio(listPatrimonio: i.get()), lazy: true),
        Bind(
            (i) => StoreSocio(
                  listPageSocio: i.get(),
                  saveSocio: i.get(),
                ),
            lazy: true),
        Bind((i) => ListPatrimonio(patrimonioRepository: i.get()), lazy: true),
        Bind((i) => SaveSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => ListPageSocio(socioRepository: i.get()), lazy: true),
        Bind((i) => ListPageSocio(socioRepository: i.get()), lazy: true),
        Bind(
            (i) => PatrimonioRepositoryImpl(
                  connectivityAdapter: i.get(),
                  patrimonioApi: i.get(),
                ),
            lazy: true),
        Bind(
            (i) => PatrimonioApiImpl(
                  apiValidation: i.get(),
                  httpAdapter: i.get(),
                ),
            lazy: true),
        Bind(
            (i) => SocioRepositoryImpl(
                  connectivityAdapter: i.get(),
                  socioApi: i.get(),
                ),
            lazy: true),
        Bind(
            (i) => SocioApiImpl(
                  httpAdapter: i.get(),
                  apiValidation: i.get(),
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
              path: "socio",
            )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => PessoaPageList(),
        ),
        ModularRouter(
          '/new',
          child: (_, args) => PessoaPageNew(),
        ),
        ModularRouter(
          '/edit/:id',
          child: (_, args) => PessoaPageEdit(id: args.params['id']),
        )
      ];
}
