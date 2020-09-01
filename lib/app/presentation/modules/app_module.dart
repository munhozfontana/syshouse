import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/presentation/modules/home/home_module.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => http.Client()),
        Bind((i) => ConnectivityAdapterImpl()),
        Bind((i) => ApiValidationImpl()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", module: HomeModule()),
      ];
}
