import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/data/datasources/socio_api.dart';
import 'package:syshouse/app/data/repositories/socio_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/socio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/socio_store.dart';
import 'package:syshouse/app/presentation/modules/pessoa/pages/pessoa_page_edit.dart';
import 'package:syshouse/app/presentation/modules/pessoa/pages/pessoa_page_list.dart';
import 'package:syshouse/app/presentation/modules/pessoa/pages/pessoa_page_new.dart';
import 'package:syshouse/core/network/http_adapter.dart';

class PessoaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StoreSocio(listPageSocio: i.get()), lazy: true),
        Bind((i) => ListPageSocio(socioRepository: i.get()), lazy: true),
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
