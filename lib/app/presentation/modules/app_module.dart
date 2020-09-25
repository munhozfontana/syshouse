import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../../../core/network/connectivity_adapter.dart';
import '../../data/datasources/utils/datasources_api_validation.dart';
import '../mobx/shared/loading_store.dart';
import '../mobx/shared/user_logged.dart';
import 'app_widget.dart';
import 'root/home/home_module.dart';
import 'root/patrimonio/patrimonio_module.dart';
import 'root/pessoa/pessoa_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => http.Client(), lazy: true),
        Bind((i) => ConnectivityAdapterImpl(), lazy: true),
        Bind((i) => ApiValidationImpl(), lazy: true),
        Bind((i) => LoadingStore(), lazy: true),
        Bind((i) => UserLogged(), lazy: true),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/pessoa', module: PessoaModule()),
        ModularRouter('/patrimonio', module: PatrimonioModule()),
      ];
}
